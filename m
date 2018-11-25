From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn-yOkvZcmFvRU@public.gmane.org>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: add
 adaptive_kbd_modes parameter
Date: Sun, 25 Nov 2018 16:41:15 +0100
Message-ID: <87zhtx17xg.fsf@miraculix.mork.no>
References: <20181115073429.z44czywrf7f65ndb@dcvr>
 <20181124232327.t3awc6dnjqdtvzwu@dcvr>
 <87in0l31b9.fsf@miraculix.mork.no>
 <20181125144441.xpwuov2i7lab3agh@dcvr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <20181125144441.xpwuov2i7lab3agh@dcvr> (Eric Wong's message of
 "Sun, 25 Nov 2018 14:44:41 +0000")
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Eric Wong <e@80x24.org>
Cc: Henrique de Moraes Holschuh <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Shuduo Sang <shuduo.sang-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

RXJpYyBXb25nIDxlQDgweDI0Lm9yZz4gd3JpdGVzOgo+IEJqw7hybiBNb3JrIDxiam9ybkBtb3Jr
Lm5vPiB3cm90ZToKPgo+PiBBbmQgdGhlbiBJIGJlbGlldmUgeW91IGhhdmUgYSBidXN5IGxvb3Ag
aGVyZToKPj4gCj4+ID4gQEAgLTM4MTUsMjAgKzM4MzgsMjAgQEAgc3RhdGljIGludCBhZGFwdGl2
ZV9rZXlib2FyZF9zZXRfbW9kZShpbnQgbmV3X21vZGUpCj4+ID4gIAo+PiA+ICBzdGF0aWMgaW50
IGFkYXB0aXZlX2tleWJvYXJkX2dldF9uZXh0X21vZGUoaW50IG1vZGUpCj4+ID4gIHsKPj4gPiAt
CXNpemVfdCBpOwo+PiA+IC0Jc2l6ZV90IG1heF9tb2RlID0gQVJSQVlfU0laRShhZGFwdGl2ZV9r
ZXlib2FyZF9tb2RlcykgLSAxOwo+PiA+IC0KPj4gPiAtCWZvciAoaSA9IDA7IGkgPD0gbWF4X21v
ZGU7IGkrKykgewo+PiA+IC0JCWlmIChhZGFwdGl2ZV9rZXlib2FyZF9tb2Rlc1tpXSA9PSBtb2Rl
KQo+PiA+IC0JCQlicmVhazsKPj4gPiAtCX0KPj4gPiArCWludCBtYXhfbW9kZSA9IGZscyhhZGFw
dGl2ZV9rYmRfbW9kZXMpOwo+PiA+ICsJaW50IG5ld19tb2RlID0gbW9kZSA+PSBtYXhfbW9kZSA/
IEhPTUVfTU9ERSA6IG1vZGUgKyAxOwo+PiA+ICAKPj4gPiAtCWlmIChpID49IG1heF9tb2RlKQo+
PiA+IC0JCWkgPSAwOwo+PiA+IC0JZWxzZQo+PiA+IC0JCWkrKzsKPj4gPiArCS8qIG1ha2Ugc3Vy
ZSB0aGUgbmV3IG1vZGUgaXMgYWxsb3dlZCBieSB0aGUgdXNlciAqLwo+PiA+ICsJd2hpbGUgKCEo
YWRhcHRpdmVfa2JkX21vZGVzICYgKDEgPDwgbmV3X21vZGUpKSkgewo+PiA+ICsJCW5ld19tb2Rl
Kys7Cj4+ID4gKwkJaWYgKG5ld19tb2RlID4gbWF4X21vZGUpCj4+ID4gKwkJCW5ld19tb2RlID0g
SE9NRV9NT0RFOwo+PiA+ICAKPj4gPiAtCXJldHVybiBhZGFwdGl2ZV9rZXlib2FyZF9tb2Rlc1tp
XTsKPj4gPiArCQkvKiBtYXliZSB0aGUgdXNlciBkaXNhYmxlZCBhbGwgb3RoZXIgbW9kZXM6ICov
Cj4+ID4gKwkJaWYgKG5ld19tb2RlID09IG1vZGUpCj4+ID4gKwkJCXJldHVybiBtb2RlOwo+PiA+
ICsJfQo+PiA+ICsJcmV0dXJuIG5ld19tb2RlOwo+PiA+ICB9Cj4KPiBOb3QgYSBidXN5IGxvb3As
IHNpbmNlIG5ld19tb2RlIHdpbGwgcmVzZXQgYXQgSE9NRV9NT0RFICgwKQo+IGFuZCB0aGVuIGl0
J2xsIGhpdCAibmV3X21vZGUgPT0gbW9kZSIgYW5kIHJlbWFpbiBsb2NrZWQgaW4KPiB0byB0aGUg
Y3VycmVudCBtb2RlLgoKUmlnaHQuICBJIHNlZSBpdCBub3cuICBUaGFua3MgZm9yIGV4cGxhaW5p
bmcuCgpJIGd1ZXNzIEkgd2FzIGV4cGVjdGluZyBhIGNvbXBsZXRlIGxvb3AgYnlwYXNzIGFsYQoK
ICBpZiAoIW1heF9tb2RlKQogICAgIHJldHVybiBtb2RlOgoKYnV0IHlvdXIgc29sdXRpb24gd2ls
bCBvZiBjb3Vyc2Ugd29yayBqdXN0IGFzIGZpbmUuCgoKCkJqw7hybgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlibS1hY3BpLWRldmVsIG1haWxpbmcg
bGlzdAppYm0tYWNwaS1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5z
b3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vaWJtLWFjcGktZGV2ZWwK
