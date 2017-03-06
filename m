From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 4/5] drm/amdgpu: fix printing the doorbell BAR info
Date: Mon, 6 Mar 2017 14:00:03 +0200
Message-ID: <CAHp75VeUTWC0p6PpRu+nw6Vqwnm2Q4-nTYh59T1efBReDou+Og@mail.gmail.com>
References: <1488800428-2854-1-git-send-email-deathsimple@vodafone.de>
 <1488800428-2854-4-git-send-email-deathsimple@vodafone.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1488800428-2854-4-git-send-email-deathsimple@vodafone.de>
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
aWFuLmtvZW5pZ0BhbWQuY29tPgo+Cj4gVGhlIGFkZHJlc3MgaXMgNjRiaXQsIG5vdCAzMmJpdC4K
Pgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5j
IHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
Pgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNl
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKPiBpbmRleCBi
ZjMxYWFmLi5hNDcwODY5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9kZXZpY2UuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kZXZpY2UuYwo+IEBAIC0zODUsNyArMzg1LDcgQEAgc3RhdGljIGludCBhbWRncHVfZG9vcmJl
bGxfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPiAgICAgICAgIGlmIChhZGV2LT5k
b29yYmVsbC5wdHIgPT0gTlVMTCkgewo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsK
PiAgICAgICAgIH0KCgo+IC0gICAgICAgRFJNX0lORk8oImRvb3JiZWxsIG1taW8gYmFzZTogMHgl
MDhYXG4iLCAodWludDMyX3QpYWRldi0+ZG9vcmJlbGwuYmFzZSk7Cj4gKyAgICAgICBEUk1fSU5G
TygiZG9vcmJlbGwgbW1pbyBiYXNlOiAweCVsbFhcbiIsICh1aW50NjRfdClhZGV2LT5kb29yYmVs
bC5iYXNlKTsKPiAgICAgICAgIERSTV9JTkZPKCJkb29yYmVsbCBtbWlvIHNpemU6ICV1XG4iLCAo
dW5zaWduZWQpYWRldi0+ZG9vcmJlbGwuc2l6ZSk7CgpJdCBzZWVtcyBJIHNlbnQgcGF0Y2ggdG8g
cmVtb3ZlIHRob3NlIGF0IGFsbCwgYnV0IGlmIHlvdSB3aXNoIHRvIGxlYXZlCnRoZW0sIHBsZWFz
ZSBjb252ZXJ0IHRvICVwYXAgYW5kIHJlbW92ZSBleHBsaWNpdCBjYXN0aW5nLgoKLS0gCldpdGgg
QmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
