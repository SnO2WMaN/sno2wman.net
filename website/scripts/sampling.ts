import {quotes} from "../config.json";

const $sampling = document.getElementById("sampling")!;

const sample = quotes.at(Math.floor(quotes.length * Math.random()))!;

$sampling.textContent = sample.text;

const $ref = document.createElement("a");
$ref.setAttribute("href", sample.link);
$ref.textContent = sample.reference!;
$sampling.appendChild($ref);
