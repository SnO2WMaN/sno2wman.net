import samples from "./samples.json";
import iamnots from "./iamnot.json";

const $iamnot = document.getElementById("iamnot")!;
const iamnot = iamnots.at(Math.floor(iamnots.length * Math.random()))!
$iamnot.textContent = iamnot;

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
