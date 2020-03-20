From: "Kammela, Gayatri" <gayatri.kammela@intel.com>
Subject: RE: [PATCH v3 0/5] platform/x86: intel_pmc_core: Add bug fixes or
 code
Date: Fri, 20 Mar 2020 17:34:21 +0000
Message-ID: <BYAPR11MB362495E980501C91DD6A8C1DF2F50@BYAPR11MB3624.namprd11.prod.outlook.com>
References: <cover.1583093898.git.gayatri.kammela@intel.com>
 <20200302125427.GV1224808@smile.fi.intel.com>
 <BYAPR11MB362421570806431752364CD3F2E70@BYAPR11MB3624.namprd11.prod.outlook.com>
 <BYAPR11MB3624F3CB24817BB8C5AE6C10F2F40@BYAPR11MB3624.namprd11.prod.outlook.com>
 <20200319180618.GN1922688@smile.fi.intel.com>
 <BYAPR11MB3624FFB1B25DD743F473AFFEF2F40@BYAPR11MB3624.namprd11.prod.outlook.com>
 <CAHp75VcnE11pTyB2wPPe596+vRf_B1monV8NDHF_TBuGv9h64Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VcnE11pTyB2wPPe596+vRf_B1monV8NDHF_TBuGv9h64Q@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Somayaji, Vishwanath" <vishwanath.somayaji@intel.com>, "dvhart@infradead.org" <dvhart@infradead.org>, "Westerberg, Mika" <mika.westerberg@intel.com>, "peterz@infradead.org" <peterz@infradead.org>, "Prestopine, Charles D" <charles.d.prestopine@intel.com>, Chen Zhou <chenzhou10@huawei.com>, "Box, David E" <david.e.box@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmR5IFNoZXZjaGVua28gPGFu
ZHkuc2hldmNoZW5rb0BnbWFpbC5jb20+DQo+IFNlbnQ6IEZyaWRheSwgTWFyY2ggMjAsIDIwMjAg
Njo1MCBBTQ0KPiBUbzogS2FtbWVsYSwgR2F5YXRyaSA8Z2F5YXRyaS5rYW1tZWxhQGludGVsLmNv
bT4NCj4gQ2M6IEFuZHkgU2hldmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwu
Y29tPjsgcGxhdGZvcm0tDQo+IGRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnOyBTb21heWFqaSwNCj4gVmlzaHdhbmF0aCA8dmlzaHdhbmF0aC5z
b21heWFqaUBpbnRlbC5jb20+OyBkdmhhcnRAaW5mcmFkZWFkLm9yZzsNCj4gV2VzdGVyYmVyZywg
TWlrYSA8bWlrYS53ZXN0ZXJiZXJnQGludGVsLmNvbT47IHBldGVyekBpbmZyYWRlYWQub3JnOw0K
PiBQcmVzdG9waW5lLCBDaGFybGVzIEQgPGNoYXJsZXMuZC5wcmVzdG9waW5lQGludGVsLmNvbT47
IENoZW4gWmhvdQ0KPiA8Y2hlbnpob3UxMEBodWF3ZWkuY29tPjsgQm94LCBEYXZpZCBFIDxkYXZp
ZC5lLmJveEBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMC81XSBwbGF0Zm9y
bS94ODY6IGludGVsX3BtY19jb3JlOiBBZGQgYnVnIGZpeGVzIG9yDQo+IGNvZGUNCj4gDQo+IE9u
IFRodSwgTWFyIDE5LCAyMDIwIGF0IDg6MTYgUE0gS2FtbWVsYSwgR2F5YXRyaQ0KPiA8Z2F5YXRy
aS5rYW1tZWxhQGludGVsLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiA+IElzIGl0IGluIG15IHJldmll
dyBhbmQgdGVzdGluZyBxdWV1ZT8NCj4gPg0KPiA+IEkgdGhpbmsgaXQgaXMgYXJjaGl2ZWQgYW5k
IHN1cGVyc2VkZWQNCj4gPiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExNDE0
Mzc5Lw0KPiANCj4gTm93IGV2ZXJ5dGhpbmcgaW4gZm9yLW5leHQsIGNoZWNrIGlmIHNvbWV0aGlu
ZyBpcyBtaXNzZWQgYW5kIHJlc2VuZC4NClRoYW5rcyBBbmR5ISBJIGp1c3Qgbm90aWNlZCA1dGgg
cGF0Y2ggaW4gdGhpcyB2ZXJzaW9uIGlzIGFjY2VwdGVkIGJ1dCA0dGggaXMgc3RpbGwgc2hvd2lu
ZyBzdXBlcnNlZGVkLiBUbyBhdm9pZCBjb25mdXNpb24sIEkgd2lsbCByZXNlbmQgdGhlIDR0aCBw
YXRjaCBhbG9uZS4NCj4gDQo+IC0tDQo+IFdpdGggQmVzdCBSZWdhcmRzLA0KPiBBbmR5IFNoZXZj
aGVua28NCg==
