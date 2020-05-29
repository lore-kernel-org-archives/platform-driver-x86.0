From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH v4 05/11] thermal: remove get_mode() operation of drivers
Date: Fri, 29 May 2020 19:22:50 +0200
Message-ID: <1c4a029e-bb5b-fcfd-1b4b-beea1d6fd577@collabora.com>
References: <20200529154910.GA158174@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org>
In-Reply-To: <20200529154910.GA158174@roeck-us.net>
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
To: Guenter Roeck <linux@roeck-us.net>
Cc: Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Heiko Stuebner <heiko@sntech.de>, Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, Peter Kaestle <peter@piie.net>, platform-driver-x86@vger.kernel.org, Vishal Kulkarni <vishal@chelsio.com>, Luca Coelho <luciano.coelho@intel.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Shawn Guo <shawnguo@kernel.org>, kernel@collabora.com, Fabio Estevam <festevam@gmail.com>, Amit Kucheria <amit.kucheria@verdurent.com>, linux-rockchip@lists.infradead.org, Chunyan Zhang <zhang.lyra@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Darren Hart <dvhart@infradead.org>, Zhang Rui <rui.zhang@intel.com>, Gayatri Kammela <gayatri.kammela@intel.com>, NXP Linux Team <linux-imx@nxp.com>, Johannes Berg <johannes.berg@intel.com>, linux-pm@vger.kernel.org, Sascha
List-Id: platform-driver-x86.vger.kernel.org

SGkgR3VlbnRlciwKClcgZG5pdSAyOS4wNS4yMDIwIG/CoDE3OjQ5LCBHdWVudGVyIFJvZWNrIHBp
c3plOgo+IE9uIFRodSwgTWF5IDI4LCAyMDIwIGF0IDA5OjIwOjQ1UE0gKzAyMDAsIEFuZHJ6ZWog
UGlldHJhc2lld2ljeiB3cm90ZToKPj4gZ2V0X21vZGUoKSBpcyBub3cgcmVkdW5kYW50LCBhcyB0
aGUgc3RhdGUgaXMgc3RvcmVkIGluIHN0cnVjdAo+PiB0aGVybWFsX3pvbmVfZGV2aWNlLgo+Pgo+
PiBDb25zZXF1ZW50bHkgdGhlICJtb2RlIiBhdHRyaWJ1dGUgaW4gc3lzZnMgY2FuIGFsd2F5cyBi
ZSB2aXNpYmxlLCBiZWNhdXNlCj4+IGl0IGlzIGFsd2F5cyBwb3NzaWJsZSB0byBnZXQgdGhlIG1v
ZGUgZnJvbSBzdHJ1Y3QgdHpkLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyemVqIFBpZXRyYXNp
ZXdpY3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEuY29tPgo+IAo+IFRoZXJlIGlzIGEgc2xpZ2h0IHNl
bWFudGljIGNoYW5nZSBmb3IgdGhlIHR3byBkcml2ZXJzIHdoaWNoIHN0aWxsIGhhdmUKPiBhIGxv
Y2FsIGNvcHkgb2YgZW51bSB0aGVybWFsX2RldmljZV9tb2RlOiBQcmV2aW91c2x5IHRyeWluZyB0
byByZWFkIHRoZQo+IG1vZGUgZm9yIHRob3NlIHdvdWxkIHJldHVybiAtRVBFUk0gc2luY2UgdGhl
eSBkb24ndCBoYXZlIGEgZ2V0X21vZGUKPiBmdW5jdGlvbi4gTm93IHRoZSBnbG9iYWwgdmFsdWUg
Zm9yIG1vZGUgaXMgcmV0dXJuZWQsIGJ1dCBJIGFtIG5vdCBzdXJlCj4gaWYgaXQgbWF0Y2hlcyB0
aGUgbG9jYWwgdmFsdWUuCgpQbGVhc2Ugc2VlIG15IHJlcGxpZXMgdG8geW91ciBjb21tZW50IGFi
b3V0IHBhdGNoIDQvMTEuCgpSZWdhcmRzLAoKQW5kcnplagoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QK
bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
