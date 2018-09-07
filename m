From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux-9XfqOkM5JgxKQ7RDE2T8Pw@public.gmane.org>
Subject: Re: [PATCH v2] platform/x86: thinkpad_acpi: Fix
 multi-battery bug
Date: Fri, 7 Sep 2018 19:59:52 +0200
Message-ID: <4e387ece-dbf1-434b-8dde-18f0fa513d99@t-8ch.de>
References: <20180801114747.qrjclik665ya7oh5@khazad-dum.debian.net>
 <20180801222418.21892-1-linux@weissschuh.net>
 <CAHp75VeprNMVniQ_KrQRU9v3kt4kxEnHYO+ds5pOYokvv=0YdQ@mail.gmail.com>
 <6c62d06dee6572f7d03280ed9e9f6d7b7d9babf1.camel@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <6c62d06dee6572f7d03280ed9e9f6d7b7d9babf1.camel-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Yves-Alexis Perez <corsac-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: Henrique de Moraes Holschuh <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, Ognjen Galic <smclt30p-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

SGkgWXZlcy1BbGV4aXMsCgpPbiBGcmksIDIwMTgtMDktMDdUMTM6NDErMDIwMCwgWXZlcy1BbGV4
aXMgUGVyZXogd3JvdGU6Cj4gT24gTW9uLCAyMDE4LTA4LTA2IGF0IDE2OjI0ICswMzAwLCBBbmR5
IFNoZXZjaGVua28gd3JvdGU6Cj4gPiBPbiBUaHUsIEF1ZyAyLCAyMDE4IGF0IDE6MjQgQU0sIFRo
b21hcyBXZWnDn3NjaHVoIDxsaW51eEB3ZWlzc3NjaHVoLm5ldD4gd3JvdGU6Cj4gPiA+IFRoZSBz
dHJ1Y3QgY29udGFpbmluZyB0aGUgc3VwcG9ydGVkIG9wZXJhdGlvbnMgZm9yIGFsbCBiYXR0ZXJp
ZXMgaXMKPiA+ID4gYmVpbmcgemVyb2VkIG9uIGVhY2ggYmF0dGVyeSBwcm9iZS4gIFRoaXMgcHJl
dmVudHMgYWxsIG90aGVyIGJhdHRlcmllcwo+ID4gPiBleGNlcHQgdGhlIGxhc3RseSBwcm9iZWQg
b25lIGZyb20gYmVpbmcgY29uZmlndXJlZC4KPiA+IAo+ID4gWW91IGZvcmdvdCB0byBpbmNsdWRl
IHN1YnN5c3RlbSBtYWludGFpbmVycyBhbG9uZyB3aXRoIGRyaXZlciBtYWludGFpbmVyLgo+ID4g
Cj4gPiBJIHB1c2hlZCB0aGlzIHRvIG15IHJldmlldyBhbmQgdGVzdGluZyBxdWV1ZSwgbWVhbndo
aWxlIEkgd291bGQgd2FpdAo+ID4gZm9yIEFjayBmcm9tIEhlbnJpcXVlLgo+IAo+IHdhcyB0aGlz
IGluY2x1ZGVkIGluIGFueSB0cmVlIGFuZCBpcyBpdCBvbiByb3V0ZSB0byBMaW51cyBzb21laG93
PwoKVGhpcyBpcyBvbiB0cmFjayB0byBiZSByZWxlYXNlZCBpbiA0LjE5LgoKPiBNeSBUaGlua1Bh
ZCBYMjUwIGhhcyB0d28gYmF0dGVyaWVzIGFuZCBJIGNhbiBvbmx5IGNvbmZpZ3VyZSB0aHJlc2hv
bGQgb24gQkFUMCwKPiBhbmQgSSBndWVzcyBpdCdzIGJlY2F1c2Ugb2YgdGhpcywgc28gaXQnZCBi
ZSBuaWNlIHRvIGhhdmUgaXQgZml4ZWQgKGFuZCBtYXliZQo+IGJhY2twb3J0ZWQgdG8gcmVsZXZh
bnQgc3RhYmxlIGtlcm5lbHMpLgoKQXMgZmFyIGFzIEkga25vdyBvbmx5IGNoYW5nZXMgdGhhdCBm
aXggYmVoYXZpb3VyIHRoYXQgd29ya2VkIGJlZm9yZSBhcmUKZWxpZ2libGUgZm9yIHN0YWJsZS4g
QXMgdGhpcyBzcGVjaWZpYyBmdW5jdGlvbmFsaXR5IG5ldmVyIHdvcmtlZCBiZWZvcmUgSQpmaWd1
cmVkIGl0IHdvdWxkIGJlIG1vb3QgdG8gYWxzbyBzZW5kIGl0IHRvIHN0YWJsZS4KCihJZiBpdCBp
cyBmaW5lIHRvIHNlbmQgc3R1ZmYgbGlrZSB0aGlzIHRvIHN0YWJsZSwgd2UgY291bGQgdHJ5LCB0
aG91Z2gpCgpUaG9tYXMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppYm0tYWNwaS1kZXZlbCBtYWlsaW5nIGxpc3QKaWJtLWFjcGktZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2libS1hY3BpLWRldmVsCg==
