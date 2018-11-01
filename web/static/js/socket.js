// NOTE: The contents of this file will only be executed if
import { Socket } from "phoenix";

let socket = new Socket("/socket", { params: { token: window.userToken } });

socket.connect();

const createSocket = topicId => {
  let channel = socket.channel(`comments:${topicId}`, {});

  channel.on(`comments:${topicId}:new`, ({ comment }) =>
    renderComment(comment)
  );

  document.querySelector("button").addEventListener("click", () => {
    const content = document.querySelector("textarea").value;

    channel.push("comment:add", { content });
  });

  channel
    .join()
    .receive("ok", resp => renderComments(resp.comments))
    .receive("error", resp => {
      console.log("Unable to join", resp);
    });
};

function getCollection() {
  return document.querySelector(".collection");
}

function commentTemplate({ content, user }) {
  return `
  <li class="collection-item">
    ${content}
    <div class="secondary-content">
      ${user ? user.email : 'Anonymous'}
    </div>
  </li>
  `;
}

function renderComments(comments) {
  getCollection().innerHTML = comments.map(commentTemplate).join("");
}

function renderComment(comment) {
  getCollection().innerHTML += commentTemplate(comment);
}

window.createSocket = createSocket;
