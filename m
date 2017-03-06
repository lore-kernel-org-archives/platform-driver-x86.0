From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 5/5] drm/amdgpu: resize VRAM BAR for CPU access
Date: Mon, 6 Mar 2017 14:06:45 +0200
Message-ID: <CAHp75Ve8WyfNjrRq2jw_puqBUOAfWMBgVFdo--tdvQ4ta5tjzQ@mail.gmail.com>
References: <1488800428-2854-1-git-send-email-deathsimple@vodafone.de>
 <1488800428-2854-5-git-send-email-deathsimple@vodafone.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1488800428-2854-5-git-send-email-deathsimple@vodafone.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <deathsimple@vodafone.de>
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

T24gTW9uLCBNYXIgNiwgMjAxNyBhdCAxOjQwIFBNLCBDaHJpc3RpYW4gS8O2bmlnIDxkZWF0aHNp
bXBsZUB2b2RhZm9uZS5kZT4gd3JvdGU6Cj4gRnJvbTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPgo+Cj4gVHJ5IHRvIHJlc2l6ZSBCQVIwIHRvIGxldCBDUFUgYWNj
ZXNzIGFsbCBvZiBWUkFNLgoKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZGV2aWNlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2
aWNlLmMKPiBAQCAtNjE2LDYgKzYxNiwzNSBAQCB2b2lkIGFtZGdwdV9ndHRfbG9jYXRpb24oc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHN0cnVjdCBhbWRncHVfbWMgKm1jKQoKPiArdm9pZCBh
bWRncHVfcmVzaXplX2JhcjAoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gK3sKPiArICAg
ICAgIHUzMiBzaXplID0gbWF4KGlsb2cyKGFkZXYtPm1jLnJlYWxfdnJhbV9zaXplIC0gMSkgKyAx
LCAyMCkgLSAyMDsKClRvbyBjb21wbGljYXRlZC4KCnVuc2lnbmVkIGxvbmcgPSBmbHNfbG9uZyhy
ZWFsX3ZyYW1fc2l6ZSB8IEJJVCgyMCkpOwoKQW5kIHRoZSByZXN1bHQgaXMgbm90IGEgc2l6ZSwg
cmlnaHQ/IEl0J3MgYSBsb2dhcml0aG0gZnJvbSBzaXplLgoKPiArICAgICAgIGludCByOwo+ICsK
PiArICAgICAgIHIgPSBwY2lfcmVzaXplX3Jlc291cmNlKGFkZXYtPnBkZXYsIDAsIHNpemUpOwoK
PiArCgpSZWR1bmRhbnQgbGluZS4KCj4gKyAgICAgICBpZiAociA9PSAtRU5PVFNVUFApIHsKPiAr
ICAgICAgICAgICAgICAgLyogVGhlIGhhcmR3YXJlIGRvbid0IHN1cHBvcnQgdGhlIGV4dGVuc2lv
bi4gKi8KPiArICAgICAgICAgICAgICAgcmV0dXJuOwo+ICsKPiArICAgICAgIH0gZWxzZSBpZiAo
ciA9PSAtRU5PU1BDKSB7Cj4gKyAgICAgICAgICAgICAgIERSTV9JTkZPKCJOb3QgZW5vaWdoIFBD
SSBhZGRyZXNzIHNwYWNlIGZvciBhIGxhcmdlIEJBUi4iKTsKPiArICAgICAgIH0gZWxzZSBpZiAo
cikgewo+ICsgICAgICAgICAgICAgICBEUk1fRVJST1IoIlByb2JsZW0gcmVzaXppbmcgQkFSMCAo
JWQpLiIsIHIpOwo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIC8qIFJlaW5pdCB0aGUgZG9vcmJl
bGwgbWFwcGluZywgaXQgaXMgbW9zdCBsaWtlbHkgbW92ZWQgYXMgd2VsbCAqLwo+ICsgICAgICAg
YW1kZ3B1X2Rvb3JiZWxsX2ZpbmkoYWRldik7Cgo+ICsgICAgICAgQlVHX09OKGFtZGdwdV9kb29y
YmVsbF9pbml0KGFkZXYpKTsKCk5vIHdheSB0byByZWNvdmVyPyEKCj4gK30KPiArCgotLSAKV2l0
aCBCZXN0IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5rbwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
