# Lemma-tests for *propernouns* in ...`propernouns.lexc`


**Гаврив** failures:

* `Гаврив+N+Prop+Sg+Nom` => `гаврилл`
* `Гаврив+N+Prop+Sg+Nom` => `Гаврил`
* `Гаврив+N+Prop+Sg+Nom` => `Гаврилл`
* `Гаврив` has no analyses either

**Альпъяс** failures:

* `Альпъяс+N+Prop+Sg+Nom` does not generate!
* `Альпъяс` has following analyses:
  * `Альпъяс+N+Prop+Sem/Plc+Pl+Nom`

**Микӧв** failures:

* `Микӧв+N+Prop+Sg+Nom` => `Микӧлл`
* `Микӧв+N+Prop+Sg+Nom` => `Микӧл`
* `Микӧв+N+Prop+Sg+Nom` => `микӧлл`
* `Микӧв` has no analyses either

**США** failures:

* `США+N+Prop+Sg+Nom` does not generate!
* `США` has following analyses:
  * `США+N+Prop+Sem/Plc+Acron+Sg+Nom`
  * `США+N+ACR+Nom`
  * `США+N+Prop+Sem/Dummytag+Src/F+Acron+Sg+Nom`
  * `США+N+Prop+Sem/Plc+Src/F+Acron+Sg+Nom`

**Елисав** failures:

* `Елисав+N+Prop+Sg+Nom` => `елисалл`
* `Елисав+N+Prop+Sg+Nom` => `Елисалл`
* `Елисав+N+Prop+Sg+Nom` => `Елисал`
* `Елисав` has no analyses either

**Вов** failures:

* `Вов+N+Prop+Sg+Nom` => `Волл`
* `Вов+N+Prop+Sg+Nom` => `Вол`
* `Вов+N+Prop+Sg+Nom` => `волл`
* `Вов` has no analyses either

**СНГ** failures:

* `СНГ+N+Prop+Sg+Nom` does not generate!
* `СНГ` has following analyses:
  * `СНГ+N+Prop+Sem/Dummytag+Src/F+Acron+Sg+Nom`
  * `СНГ+N+Prop+Sem/Plc+Acron+Sg+Nom`
  * `СНГ+N+ACR+Nom`

**Микув** failures:

* `Микув+N+Prop+Sg+Nom` => `Микул`
* `Микув+N+Prop+Sg+Nom` => `Микулл`
* `Микув+N+Prop+Sg+Nom` => `микулл`
* `Микув` has no analyses either

**Аипав** failures:

* `Аипав+N+Prop+Sg+Nom` => `аипалл`
* `Аипав+N+Prop+Sg+Nom` => `Аипалл`
* `Аипав+N+Prop+Sg+Nom` => `Аипал`
* `Аипав` has no analyses either

**КПСС** failures:

* `КПСС+N+Prop+Sg+Nom` does not generate!
* `КПСС` has following analyses:
  * `КПСС+N+ACR+Nom`
  * `КПСС+N+Prop+Sem/Dummytag+Src/F+Acron+Sg+Nom`
  * `КПСС+N+Prop+Acron+Sg+Nom`

**ЦВК** failures:

* `ЦВК+N+Prop+Sg+Nom` does not generate!
* `ЦВК` has following analyses:
  * `ЦВК+N+ACR+Nom`
  * `ЦВК+N+Prop+Acron+Sg+Nom`

## Lemma statistics
* 2071 lemmas
* 99.22742636407533 % success

## Settings used

```json
{
    "adjectives": {
        "lemmatags": [
            "+A+Sg+Nom"
        ],
        "lexcfile": ".../adjectives.lexc"
    },
    "analyser": ".../analyser-gt-norm.hfstol",
    "generator": ".../generator-gt-norm.hfstol",
    "nouns": {
        "lemmatags": [
            "+N+Sg+Nom",
            "+N+Pl+Nom"
        ],
        "lexcfile": ".../nouns.lexc"
    },
    "propernouns": {
        "lemmatags": [
            "+N+Prop+Sg+Nom"
        ],
        "lexcfile": ".../propernouns.lexc"
    },
    "verbs": {
        "lemmatags": [
            "+V+Inf"
        ],
        "lexcfile": ".../verbs.lexc"
    }
}
```
