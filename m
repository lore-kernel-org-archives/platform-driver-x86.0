From: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH] drivers: depend on instead of select
 BACKLIGHT_CLASS_DEVICE and ACPI_VIDEO
Date: Wed, 29 Oct 2014 09:54:36 +0200
Message-ID: <87tx2njooz.fsf@intel.com>
References: <1413580403-16225-1-git-send-email-jani.nikula@intel.com>
 <54476492.6090105@ti.com> <87a94hu3j0.fsf@intel.com>
 <544E44E9.4040208@ti.com> <544FFC91.9040104@infradead.org>
 <1414551853.7417.1.camel@concordia>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1414551853.7417.1.camel@concordia>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-fbdev@vger.kernel.org, linux-usb@vger.kernel.org, Daniel Drake <dsd@laptop.org>, Jens Frederich <jfrederich@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jon Nettleton <jon.nettleton@gmail.com>, Jingoo Han <jg1.han@samsung.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, Bryan Wu <cooloney@gmail.com>, linuxppc-dev@lists.ozlabs.org, Tomi Valkeinen <tomi.valkeinen@ti.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Daniel Vetter <daniel.vetter@intel.com>, Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>
List-Id: platform-driver-x86.vger.kernel.org

T24gV2VkLCAyOSBPY3QgMjAxNCwgTWljaGFlbCBFbGxlcm1hbiA8bXBlQGVsbGVybWFuLmlkLmF1
PiB3cm90ZToKPiBPbiBUdWUsIDIwMTQtMTAtMjggYXQgMTM6MjkgLTA3MDAsIFJhbmR5IER1bmxh
cCB3cm90ZToKPj4gT24gMTAvMjcvMTQgMDY6MTMsIFRvbWkgVmFsa2VpbmVuIHdyb3RlOgo+PiA+
IEkgYWxzbyB0aGluayB0aGUgJ2RlcGVuZHMgb24gQkFDS0xJR0hUX0NMQVNTX0RFVklDRSB8fAo+
PiA+IEJBQ0tMSUdIVF9DTEFTU19ERVZJQ0U9bicgcGF0dGVybiBpcyBxdWl0ZS4uLiBpbnRlcmVz
dGluZyAoaS5lLiBzb3VuZHMKPj4gPiBsaWtlIGEgaGFjayB0byBtZSA9KS4KPj4gCj4+IEl0IGRv
ZXMgZXhhY3RseSB3aGF0IGlzIG5lZWRlZCBhbmQgaXQgaXMgdXNlZCBpbiBtYW55IHBsYWNlcyBp
biBrZXJuZWwKPj4gS2NvbmZpZyBmaWxlcy4KPgo+IElzIHRoZXJlIGFueSByZWFzb24geW91IGNh
bid0IGRvOgo+Cj4gICBkZXBlbmRzIG9uIEJBQ0tMSUdIVF9DTEFTU19ERVZJQ0UgIT0gbQoKVGhh
dCdzIG5vdCB0aGUgc2FtZSB0aGluZy4gVGhlIEZPTyB8fCBGT089biBhbGxvd3MgZm9yIGFsbCBv
cHRpb25zLCBidXQKZm9yYmlkcyBpdCBiZWluZyBhIG1vZHVsZSB3aGVuIHRoZSBvcHRpb24gZGVw
ZW5kaW5nIG9uIGl0IGlzCmJ1aWx0LWluLiBPYnZpb3VzbHkgc29tZXRoaW5nIHRoYXQncyBidWls
dC1pbiBjYW4ndCBkZXBlbmQgb24gc29tZXRoaW5nCmJ1aWx0IGFzIGEgbW9kdWxlLgoKQlIsCkph
bmkuCgoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBUZWNobm9sb2d5IENlbnRl
cgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
