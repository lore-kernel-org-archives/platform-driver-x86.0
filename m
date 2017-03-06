From: =?UTF-8?q?Christian=20K=C3=B6nig?= <deathsimple@vodafone.de>
Subject: [PATCH 4/5] drm/amdgpu: fix printing the doorbell BAR info
Date: Mon,  6 Mar 2017 12:40:27 +0100
Message-ID: <1488800428-2854-4-git-send-email-deathsimple@vodafone.de>
References: <1488800428-2854-1-git-send-email-deathsimple@vodafone.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1488800428-2854-1-git-send-email-deathsimple@vodafone.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

RnJvbTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKVGhlIGFk
ZHJlc3MgaXMgNjRiaXQsIG5vdCAzMmJpdC4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7Zu
aWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZGV2aWNlLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2
aWNlLmMKaW5kZXggYmYzMWFhZi4uYTQ3MDg2OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kZXZpY2UuYwpAQCAtMzg1LDcgKzM4NSw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1
X2Rvb3JiZWxsX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJaWYgKGFkZXYtPmRv
b3JiZWxsLnB0ciA9PSBOVUxMKSB7CiAJCXJldHVybiAtRU5PTUVNOwogCX0KLQlEUk1fSU5GTygi
ZG9vcmJlbGwgbW1pbyBiYXNlOiAweCUwOFhcbiIsICh1aW50MzJfdClhZGV2LT5kb29yYmVsbC5i
YXNlKTsKKwlEUk1fSU5GTygiZG9vcmJlbGwgbW1pbyBiYXNlOiAweCVsbFhcbiIsICh1aW50NjRf
dClhZGV2LT5kb29yYmVsbC5iYXNlKTsKIAlEUk1fSU5GTygiZG9vcmJlbGwgbW1pbyBzaXplOiAl
dVxuIiwgKHVuc2lnbmVkKWFkZXYtPmRvb3JiZWxsLnNpemUpOwogCiAJcmV0dXJuIDA7Ci0tIAoy
LjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
