From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [RFC 0/8] Stop monitoring disabled devices
Date: Wed, 15 Apr 2020 12:40:09 +0200
Message-ID: <dc999149-d168-0b86-0559-7660e0fdec77@samsung.com>
References: <20200407174926.23971-1-andrzej.p@collabora.com>
 <2bc5a902-acde-526a-11a5-2357d899916c@linaro.org>
 <aeec2ce8-8fb9-9353-f3dd-36a476ceeb3b@collabora.com>
 <CGME20200415104010eucas1p101278e53e34a2e56dfc7c82b533a9122@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org>
In-Reply-To: <aeec2ce8-8fb9-9353-f3dd-36a476ceeb3b@collabora.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: "Rafael J . Wysocki" <rjw@rjwysocki.net>, platform-driver-x86@vger.kernel.org, kernel@collabora.com, Fabio Estevam <festevam@gmail.com>, Amit Kucheria <amit.kucheria@verdurent.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-acpi@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>, Darren Hart <dvhart@infradead.org>, Zhang Rui <rui.zhang@intel.com>, Gayatri Kammela <gayatri.kammela@intel.com>, Len Brown <lenb@kernel.org>, linux-pm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Ido Schimmel <idosch@mellanox.com>, Jiri Pirko <jiri@mellanox.com>, Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>, linux-arm-kernel@lists.infradead.org, Support Opensource <support.opensource@diasemi.com>, Shawn Guo <shawnguo@kernel.org>, Peter Kaestle <peter@piie.net>, Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org, Enrico
List-Id: platform-driver-x86.vger.kernel.org

Ck9uIDQvOS8yMCAxOjEwIFBNLCBBbmRyemVqIFBpZXRyYXNpZXdpY3ogd3JvdGU6Cj4gSGkgRGFu
aWVsLAo+IAo+IFcgZG5pdSAwOS4wNC4yMDIwIG/CoDEyOjI5LCBEYW5pZWwgTGV6Y2FubyBwaXN6
ZToKPj4gT24gMDcvMDQvMjAyMCAxOTo0OSwgQW5kcnplaiBQaWV0cmFzaWV3aWN6IHdyb3RlOgo+
Pj4gVGhlIGN1cnJlbnQga2VybmVsIGJlaGF2aW9yIGlzIHRvIGtlZXAgcG9sbGluZyB0aGUgdGhl
cm1hbCB6b25lIGRldmljZXMKPj4+IHJlZ2FyZGxlc3Mgb2YgdGhlaXIgY3VycmVudCBtb2RlLiBU
aGlzIGlzIG5vdCBkZXNpcmVkLCBhcyBhbGwgc3VjaCAiZGlzYWJsZWQiCj4+PiBkZXZpY2VzIGFy
ZSBtZWFudCB0byBiZSBoYW5kbGVkIGJ5IHVzZXJzcGFjZSw+IHNvIHBvbGxpbmcgdGhlbSBtYWtl
cyBubyBzZW5zZS4KPj4KPj4gVGhhbmtzIGZvciBwcm9wb3NpbmcgdGhlc2UgY2hhbmdlcy4KPj4K
Pj4gSSd2ZSBiZWVuIChxdWlja2x5KSB0aHJvdWdoIHRoZSBzZXJpZXMgYW5kIHRoZSBkZXNjcmlw
dGlvbiBiZWxvdy4gSSBoYXZlCj4+IHRoZSBmZWVsaW5nIHRoZSBzZXJpZXMgbWFrZXMgbW9yZSBj
b21wbGV4IHdoaWxlIHRoZSBjdXJyZW50IGNvZGUgd2hpY2gKPj4gd291bGQgZGVzZXJ2ZSBhIGNs
ZWFudXAuCj4+Cj4+IFdoeSBub3QgZmlyc3Q6Cj4+Cj4+IMKgIC0gQWRkIGEgJ21vZGUnIGZpZWxk
IGluIHRoZSB0aGVybWFsIHpvbmUgZGV2aWNlCj4+IMKgIC0gS2lsbCBhbGwgc2V0L2dldF9tb2Rl
IGNhbGxiYWNrcyBpbiB0aGUgZHJpdmVycyB3aGljaCBhcmUgZHVwbGljYXRlZCBjb2RlLgo+PiDC
oCAtIEFkZCBhIGZ1bmN0aW9uOgo+Pgo+PiDCoCBlbnVtIHRoZXJtYWxfZGV2aWNlX21vZGUgdGhl
cm1hbF96b25lX2dldF9tb2RlKCAqdHopCj4+IMKgIHsKPj4gwqDCoMKgwqAuLi4KPj4gwqDCoMKg
wqBpZiAodHotPm9wcy0+Z2V0X21vZGUpCj4+IMKgwqDCoMKgwqDCoMKgIHJldHVybiB0ei0+b3Bz
LT5nZXRfbW9kZSgpOwo+Pgo+PiDCoMKgwqDCoHJldHVybiB0ei0+bW9kZTsKPj4gwqAgfQo+Pgo+
Pgo+PiDCoCBpbnQgdGhlcm1hbF96b25lX3NldF9tb2RlKC4uKnR6LCBlbnVtIHRoZXJtYWxfZGV2
aWNlX21vZGUgbW9kZSkKPj4gwqAgewo+PiDCoMKgwqDCoC4uLgo+PiDCoMKgwqDCoGlmICh0ei0+
b3BzLT5zZXRfbW9kZSkKPj4gwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHR6LT5vcHMtPnNldF9tb2Rl
KHR6LCBtb2RlKTsKPj4KPj4gwqDCoMKgwqB0ei0+bW9kZSA9IG1vZGU7Cj4+Cj4+IMKgwqDCoMKg
cmV0dXJuIDA7Cj4+IMKgIH0KPj4KPj4gwqAgc3RhdGljIGlubGluZSB0aGVybWFsX3pvbmVfZW5h
YmxlKC4uLiAqdHopCj4+IMKgIHsKPj4gwqDCoMKgwqB0aGVybWFsX3pvbmVfc2V0X21vZGUodHos
IFRIRVJNQUxfREVWSUNFX0VOQUJMRUQpOwo+PiDCoCB9Cj4+Cj4+IMKgIHN0YXRpYyBpbmxpbmUg
dGhlcm1hbF96b25lX2Rpc2FibGUoLi4uICp0eikgewo+PiDCoMKgwqDCoHRoZXJtYWxfem9uZV9z
ZXRfbW9kZSh0eiwgVEhFUk1BTF9ERVZJQ0VfRElTQUJMRUQpOwo+PiDCoCB9Cj4+Cj4+IEFuZCB0
aGVuIHdoZW4gdGhlIGNvZGUgaXMgY29uc29saWRhdGVkLCB1c2UgdGhlIG1vZGUgdG8gZW5hYmxl
L2Rpc2FibGUKPj4gdGhlIHBvbGxpbmcgYW5kIGNvbnRpbnVlIGtpbGxpbmcgdGhlIGR1cGxpY2F0
ZWQgY29kZSBpbiBvZi10aGVybWFsLmMgYW5kCj4+IGFueXdoZXJlIGVsc2UuCj4+Cj4+Cj4gCj4g
VGhhbmtzIGZvciBmZWVkYmFjay4KPiAKPiBBbnlvbmUgZWxzZT8KClllcy4gOikKClBsZWFzZSB0
YWtlIGEgbG9vayBhdCB0aGUgZm9sbG93aW5nIHBhdGNoc2V0ICh3aGljaCBJJ20gcmV2aXZpbmcg
Y3VycmVudGx5KToKCglodHRwczovL2xrbWwub3JnL2xrbWwvMjAxOC8xMC8xNy85MjYKCkl0IG92
ZXJsYXBzIHBhcnRpYWxseSB3aXRoIHlvdXIgd29yayBzbyB3ZSBuZWVkIHRvIGNvb3JkaW5hdGUg
b3VyIGVmZm9ydHMuCgpCZXN0IHJlZ2FyZHMsCi0tCkJhcnRsb21pZWogWm9sbmllcmtpZXdpY3oK
U2Ftc3VuZyBSJkQgSW5zdGl0dXRlIFBvbGFuZApTYW1zdW5nIEVsZWN0cm9uaWNzCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVs
IG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
