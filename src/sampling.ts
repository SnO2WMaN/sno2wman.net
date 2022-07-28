import samples from "./samples.json";

const $sampling = document.getElementById("sampling")!;
const sample = samples.at(Math.floor(samples.length * Math.random()))!

$sampling.textContent = sample.text
if (!!sample.link) {
  const $ref = document.createElement("a");
  $ref.setAttribute("href", sample.link)
  $ref.textContent = sample.ref!;
  $sampling.appendChild($ref)
} else {
  const $ref = document.createElement("span");
  $ref.textContent = sample.ref!;
  $sampling.appendChild($ref)
}
