From: Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>
Subject: Re: [PATCH v2] platform/x86: thinkpad_acpi: Fix
 multi-battery bug
Date: Fri, 7 Sep 2018 18:37:02 -0300
Message-ID: <20180907213702.5poafu7kmbxbe6ew@khazad-dum.debian.net>
References: <20180801114747.qrjclik665ya7oh5@khazad-dum.debian.net>
 <20180801222418.21892-1-linux@weissschuh.net>
 <CAHp75VeprNMVniQ_KrQRU9v3kt4kxEnHYO+ds5pOYokvv=0YdQ@mail.gmail.com>
 <6c62d06dee6572f7d03280ed9e9f6d7b7d9babf1.camel@debian.org>
 <4e387ece-dbf1-434b-8dde-18f0fa513d99@t-8ch.de>
 <d91099a3353c6eb11ea9eaa5fa8409dc86f7f7ed.camel@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <d91099a3353c6eb11ea9eaa5fa8409dc86f7f7ed.camel-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Yves-Alexis Perez <corsac-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: Henrique de Moraes Holschuh <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux-9XfqOkM5JgxKQ7RDE2T8Pw@public.gmane.org>, Ognjen Galic <smclt30p-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

T24gRnJpLCAwNyBTZXAgMjAxOCwgWXZlcy1BbGV4aXMgUGVyZXogd3JvdGU6Cj4gLS0tLS1CRUdJ
TiBQR1AgU0lHTkVEIE1FU1NBR0UtLS0tLQo+IEhhc2g6IFNIQTI1Ngo+IAo+IE9uIEZyaSwgMjAx
OC0wOS0wNyBhdCAxOTo1OSArMDIwMCwgVGhvbWFzIFdlacOfc2NodWggd3JvdGU6Cj4gPiA+IHdh
cyB0aGlzIGluY2x1ZGVkIGluIGFueSB0cmVlIGFuZCBpcyBpdCBvbiByb3V0ZSB0byBMaW51cyBz
b21laG93Pwo+ID4gCj4gPiBUaGlzIGlzIG9uIHRyYWNrIHRvIGJlIHJlbGVhc2VkIGluIDQuMTku
Cj4gCj4gVGhhbmtzLiBJJ3ZlIGFwcGxpZWQgdGhlIHRocmVlIHBhdGNoZXMgKHRoaXMgb25lIGFu
ZCB0aGUgdHdvIGZyb20gSm91a2UpIG9uCj4gdG9wIG9mIDQuMTguNiBhbmQgSSBjb25maXJtIEkg
Y2FuIHNldCB0aGUgdGhyZXNob2xkcyBvbiBCQVQxLgo+ID4gCj4gPiA+IE15IFRoaW5rUGFkIFgy
NTAgaGFzIHR3byBiYXR0ZXJpZXMgYW5kIEkgY2FuIG9ubHkgY29uZmlndXJlIHRocmVzaG9sZCBv
biBCQVQwLAo+ID4gPiBhbmQgSSBndWVzcyBpdCdzIGJlY2F1c2Ugb2YgdGhpcywgc28gaXQnZCBi
ZSBuaWNlIHRvIGhhdmUgaXQgZml4ZWQgKGFuZCBtYXliZQo+ID4gPiBiYWNrcG9ydGVkIHRvIHJl
bGV2YW50IHN0YWJsZSBrZXJuZWxzKS4KPiA+IAo+ID4gQXMgZmFyIGFzIEkga25vdyBvbmx5IGNo
YW5nZXMgdGhhdCBmaXggYmVoYXZpb3VyIHRoYXQgd29ya2VkIGJlZm9yZSBhcmUKPiA+IGVsaWdp
YmxlIGZvciBzdGFibGUuIEFzIHRoaXMgc3BlY2lmaWMgZnVuY3Rpb25hbGl0eSBuZXZlciB3b3Jr
ZWQgYmVmb3JlIEkKPiA+IGZpZ3VyZWQgaXQgd291bGQgYmUgbW9vdCB0byBhbHNvIHNlbmQgaXQg
dG8gc3RhYmxlLgo+IAo+IFdlbGwsIGl0IGRvZXMgc29tZWhvdyB3b3JrIHdoZW4geW91IGhhdmUg
b25lIGJhdHRlcnksIGJ1dCBpdCdzIHJlYWxseQo+IGZydXN0cmF0aW5nIHRvIGhhdmUgaXQgbm90
IHdvcmsgZm9yIHRoZSBzZWNvbmQgb25lLgo+ID4gCj4gPiAoSWYgaXQgaXMgZmluZSB0byBzZW5k
IHN0dWZmIGxpa2UgdGhpcyB0byBzdGFibGUsIHdlIGNvdWxkIHRyeSwgdGhvdWdoKQo+IAo+IElu
ZGVlZCwgbm90IHN1cmUgaWYg4oCcZnJ1c3RyYXRpbmfigJ0gaXMgcmVhc29uIGVub3VnaCBmb3Ig
c3RhYmxlIDopCgpGV0lXLCBvbmNlIGdpdmVuIGVub3VnaCB0ZXN0aW5nLCB5ZXMsIEkgdGhpbmsg
dGhpcyBzaG91bGQgYmUgcHJvcG9zZWQKZm9yIC1zdGFibGUuCgotLSAKICBIZW5yaXF1ZSBIb2xz
Y2h1aAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmli
bS1hY3BpLWRldmVsIG1haWxpbmcgbGlzdAppYm0tYWNwaS1kZXZlbEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vaWJtLWFj
cGktZGV2ZWwK
