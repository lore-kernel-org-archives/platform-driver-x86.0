From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [RFC v2 1/9] thermal: int3400_thermal: Statically initialize
 .get_mode()/.set_mode() ops
Date: Wed, 15 Apr 2020 11:23:09 +0200
Message-ID: <3f271ce1-b4bf-4516-7e6d-7a26bd6953de@linaro.org>
References: <2bc5a902-acde-526a-11a5-2357d899916c@linaro.org>
 <20200414180105.20042-1-andrzej.p@collabora.com>
 <20200414180105.20042-2-andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org>
In-Reply-To: <20200414180105.20042-2-andrzej.p@collabora.com>
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
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>, linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rjw@rjwysocki.net>, platform-driver-x86@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, kernel@collabora.com, Fabio Estevam <festevam@gmail.com>, Amit Kucheria <amit.kucheria@verdurent.com>, linux-acpi@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>, Darren Hart <dvhart@infradead.org>, Zhang Rui <rui.zhang@intel.com>, Gayatri Kammela <gayatri.kammela@intel.com>, Len Brown <lenb@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sascha Hauer <s.hauer@pengutronix.de>, Ido Schimmel <idosch@mellanox.com>, Jiri Pirko <jiri@mellanox.com>, Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>, linux-arm-kernel@lists.infradead.org, Support Opensource <support.opensource@diasemi.com>, netdev@vger.kernel.org, Peter Kaestle <peter@piie.net>, Pengutronix Kernel Team <kernel@pengutronix.de>, Enrico Weigelt <info@metux.>
List-Id: platform-driver-x86.vger.kernel.org

T24gMTQvMDQvMjAyMCAyMDowMCwgQW5kcnplaiBQaWV0cmFzaWV3aWN6IHdyb3RlOgo+IGludDM0
MDBfdGhlcm1hbF9vcHMgaXMgdXNlZCBpbnNpZGUgaW50MzQwMF90aGVybWFsX3Byb2JlKCkgb25s
eSBhZnRlcgo+IHRoZSBhc3NpZ25tZW50cywgd2hpY2ggY2FuIGp1c3QgYXMgd2VsbCBiZSBtYWRl
IHN0YXRpY2FsbHkgYXQgc3RydWN0J3MKPiBpbml0aXplci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBB
bmRyemVqIFBpZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEuY29tPgo+IC0tLQoKQXBw
bGllZCB0aGlzIHBhdGNoIHdpdGggQmFydGxvbWllaidzIHRhZy4KClRoYW5rcwoKICAtLSBEYW5p
ZWwKCgoKLS0gCjxodHRwOi8vd3d3LmxpbmFyby5vcmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNv
dXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKCkZvbGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5m
YWNlYm9vay5jb20vcGFnZXMvTGluYXJvPiBGYWNlYm9vayB8CjxodHRwOi8vdHdpdHRlci5jb20v
IyEvbGluYXJvb3JnPiBUd2l0dGVyIHwKPGh0dHA6Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxv
Zy8+IEJsb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFybS1rZXJuZWwK
