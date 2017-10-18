From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v3 10/14] extcon: intel-int3496: Add support for
 controlling the USB-role mux
Date: Wed, 18 Oct 2017 11:14:17 +0200
Message-ID: <fcf866a4-950f-4258-ee31-cb2344e8ed37@redhat.com>
References: <20170922183803.10701-1-hdegoede@redhat.com>
 <CGME20170922183852epcas4p10bfda717358daa0aca9fa60fe7cf370c@epcas4p1.samsung.com>
 <20170922183803.10701-10-hdegoede@redhat.com> <59E6BD6A.4020101@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <59E6BD6A.4020101@samsung.com>
Content-Language: en-US
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Peter Rosin <peda@axentia.se>, Mathias Nyman <mathias.nyman@intel.com>
Cc: devel@driverdev.osuosl.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

SGksCgpPbiAxOC0xMC0xNyAwNDozMywgQ2hhbndvbyBDaG9pIHdyb3RlOgo+IEhpIEhhbnMsCj4g
Cj4gT24gMjAxN+uFhCAwOeyblCAyM+ydvCAwMzozNywgSGFucyBkZSBHb2VkZSB3cm90ZToKPj4g
Q2hlcnJ5IFRyYWlsIFNvQ3MgaGF2ZSBhIGJ1aWx0LWluIFVTQi1yb2xlIG11eCBmb3Igc3dpdGNo
aW5nIGJldHdlZW4KPj4gdGhlIGhvc3QgYW5kIGRldmljZSBjb250cm9sbGVycywgcmF0aGVyIHRo
ZW4gdXNpbmcgYW4gZXh0ZXJuYWwgbXV4Cj4+IGNvbnRyb2xsZXIgYnkgYSBHUElPLgo+Pgo+PiBU
aGVyZSBpcyBhIGRyaXZlciB1c2luZyB0aGUgbXV4LXN1YnN5cyB0byBjb250cm9sIHRoaXMgbXV4
LCB0aGlzCj4+IGNvbW1pdCBhZGRzIHN1cHBvcnQgdG8gdGhlIGludGVsLWludDM0OTYgZHJpdmVy
IHRvIGdldCBhIG11eF9jb250cm9sbGVyCj4+IGhhbmRsZSBmb3IgdGhlIG11eCBhbmQgc2V0IHRo
ZSBtdXggdGhyb3VnaCB0aGUgbXV4LXN1YnN5cyByYXRoZXIgdGhlbgo+PiB0aHJvdWdoIGEgR1BJ
Ty4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNv
bT4KPj4gLS0tCj4+IENoYW5nZXMgaW4gdjI6Cj4+IC1Ecm9wIHx8IENPTVBJTEVfVEVTVCBmcm9t
IEtjb25maWcgZGVwZW5kcyBvbiwgYXMgd2Ugd2lsbCBub3cgZmFpbCB0bwo+PiAgIGNvbXBpbGUg
b24gIVg4Ngo+PiAtTWlub3IgY29kZSBzdHlsZSB0d2Vha3MKPj4gLS0tCj4+ICAgZHJpdmVycy9l
eHRjb24vS2NvbmZpZyAgICAgICAgICAgICAgICB8ICAzICstCj4+ICAgZHJpdmVycy9leHRjb24v
ZXh0Y29uLWludGVsLWludDM0OTYuYyB8IDU5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCA2MSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4gCj4gQWNrZWQtYnk6IENoYW53b28gQ2hvaSA8Y3cwMC5jaG9pQHNhbXN1bmcuY29tPgoK
Tm90ZSB0aGF0IHRoZXJlIGhhdmUgYmVlbiBzb21lIGNvbW1lbnRzIG9uIHRoaXMgc2VyaWVzLCBh
bmQgaXQKaXMgbm90IHN1cmUgeWV0IGhvdyB3ZSBhcmUgZ29pbmcgdG8gZW5kIHVwIGhhbmRsaW5n
IHRoaXMuIFNvCnBsZWFzZSBkbyBub3QgbWVyZ2UgdGhpcyB5ZXQsIGFzIHdlIG1heSBlbmQgdXAg
d2l0aCBhbm90aGVyCnNvbHV0aW9uLgoKUmVnYXJkcywKCkhhbnMKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZGV2ZWwgbWFpbGluZyBsaXN0CmRldmVsQGxp
bnV4ZHJpdmVycHJvamVjdC5vcmcKaHR0cDovL2RyaXZlcmRldi5saW51eGRyaXZlcnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpdmVyZGV2LWRldmVsCg==
