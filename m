From: Lukas Wunner <lukas@wunner.de>
Subject: [PATCH 0/1] apple-gmux: Add initial documentation
Date: Mon, 4 Jan 2016 17:52:06 +0100
Message-ID: <cover.1451909346.git.lukas@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Andreas Heider <andreas@meetr.de>, Seth Forshee <seth.forshee@canonical.com>, William Brown <william@blackhats.net.au>, Bruno Bierbaumer <bruno@bierbaumer.net>, Bruno Premont <bonbons@linux-vserver.org>, Bernhard Froemel <froemel@vmars.tuwien.ac.at>
List-Id: platform-driver-x86.vger.kernel.org

SW5pdGlhbCBkb2N1bWVudGF0aW9uIGZvciBhcHBsZS1nbXV4LiBJZiBhbnlvbmUgaGFzIGFkZGl0
aW9ucyBvcgpjb3JyZWN0aW9ucyBwbGVhc2UgbGV0IG1lIGtub3cuCgpUaGlzIHVzZXMgYXNjaWlk
b2MgbWFya3VwLCBhbiBIVE1MIHJlbmRlcmVkIHZlcnNpb24gaXMgYXZhaWxhYmxlIGhlcmU6Cmh0
dHA6Ly93dW5uZXIuZGUvZ3B1X2RvY3MvaGFuZGxlcnMuaHRtbAoKSWYgeW91IHByZWZlciBwZXJ1
c2luZyB0aGUgcGF0Y2ggaW4gYSBicm93c2VyOgpodHRwczovL2dpdGh1Yi5jb20vbDFrL2xpbnV4
L2NvbW1pdC82OGViMDY2MDg5MzQ2YjRiYTlhZWZkY2JjNjllNjY1MjQ0Mjc1MTVlCgpARGFycmVu
IEhhcnQ6CkJhcnJpbmcgYW55IG9iamVjdGlvbnMsIHBsZWFzZSBraW5kbHkgcHJvdmlkZSBhbiBh
Y2sgZm9yIG1lcmdpbmcgdmlhCmRybS1uZXh0IG9yIGRybS1pbnRlbCBhcyBJIHdpbGwgcG9zdCBh
IG5ldyBpdGVyYXRpb24gb2YgbXkgR1BVIHN3aXRjaGluZwpwYXRjaGVzIHNob3J0bHkgd2hpY2gg
YXJlIGJhc2VkIG9uIHRoaXMgcGF0Y2ggYW5kIHdoaWNoIHNob3VsZCBhbHNvIGdvIGluCnZpYSBk
cm0tbmV4dC9kcm0taW50ZWwuIFRoYW5rIHlvdSEKCgpMdWthcyBXdW5uZXIgKDEpOgogIGFwcGxl
LWdtdXg6IEFkZCBpbml0aWFsIGRvY3VtZW50YXRpb24KCiBEb2N1bWVudGF0aW9uL0RvY0Jvb2sv
Z3B1LnRtcGwgICAgfCAgMjIgKysrKysrKysKIGRyaXZlcnMvcGxhdGZvcm0veDg2L2FwcGxlLWdt
dXguYyB8IDExMyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMiBmaWxl
cyBjaGFuZ2VkLCAxMzUgaW5zZXJ0aW9ucygrKQoKLS0gCjEuOC41LjIgKEFwcGxlIEdpdC00OCkK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
