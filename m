From: "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
Subject: Re: [PATCH v2 4/4] thermal: int340x_thermal: Add new Tiger Lake
 hardware IDs to support thermal driver
Date: Mon, 16 Dec 2019 17:05:55 +0000
Message-ID: <752244e73e3703b6d20da3ab870e4e86f9e4a3fb.camel@intel.com>
References: <cover.1576260216.git.gayatri.kammela@intel.com>
         <8964445c268f61beb8fbaa3f54b469ddd7f8cafa.1576260216.git.gayatri.kammela@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8964445c268f61beb8fbaa3f54b469ddd7f8cafa.1576260216.git.gayatri.kammela@intel.com>
Content-Language: en-US
Content-ID: <AA96230C7571B74CA249DB7FDE131EEB@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Kammela, Gayatri" <gayatri.kammela@intel.com>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Zhang, Rui" <rui.zhang@intel.com>, "dvhart@infradead.org" <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "amit.kucheria@verdurent.com" <amit.kucheria@verdurent.com>, "Prestopine, Charles D" <charles.d.prestopine@intel.com>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>, "alex.hung@canonical.com" <alex.hung@canonical.com>, "lenb@kernel.org" <lenb@kernel.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

T24gRnJpLCAyMDE5LTEyLTEzIGF0IDEwOjE0IC0wODAwLCBHYXlhdHJpIEthbW1lbGEgd3JvdGU6
DQo+IFRpZ2VyIExha2UgaGFzIGEgbmV3IHVuaXF1ZSBoYXJkd2FyZSBJRHMgdG8gc3VwcG9ydCB0
aGVybWFsIGRyaXZlci4NCj4gSGVuY2UsIGFkZCB0aGVtLg0KPiANCj4gQ2M6IEFuZHkgU2hldmNo
ZW5rbyA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPg0KPiBDYzogWmhhbmcgcnVp
IDxydWkuemhhbmdAaW50ZWwuY29tPg0KPiBDYzogU3Jpbml2YXMgUGFuZHJ1dmFkYSA8c3Jpbml2
YXMucGFuZHJ1dmFkYUBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEdheWF0cmkgS2FtbWVs
YSA8Z2F5YXRyaS5rYW1tZWxhQGludGVsLmNvbT4NClJldmlld2VkLWJ5OiBQYW5kcnV2YWRhLCBT
cmluaXZhcyA8c3Jpbml2YXMucGFuZHJ1dmFkYUBpbnRlbC5jb20+DQoNCj4gLS0tDQo+ICBkcml2
ZXJzL3RoZXJtYWwvaW50ZWwvaW50MzQweF90aGVybWFsL2ludDM0MDBfdGhlcm1hbC5jIHwgMSAr
DQo+ICBkcml2ZXJzL3RoZXJtYWwvaW50ZWwvaW50MzQweF90aGVybWFsL2ludDM0MDNfdGhlcm1h
bC5jIHwgMSArDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvdGhlcm1hbC9pbnRlbC9pbnQzNDB4X3RoZXJtYWwvaW50MzQwMF90
aGVybWFsLmMNCj4gYi9kcml2ZXJzL3RoZXJtYWwvaW50ZWwvaW50MzQweF90aGVybWFsL2ludDM0
MDBfdGhlcm1hbC5jDQo+IGluZGV4IDM1MTc4ODNiNWNkYi4uZWZhZTBjMDJkODk4IDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL3RoZXJtYWwvaW50ZWwvaW50MzQweF90aGVybWFsL2ludDM0MDBfdGhl
cm1hbC5jDQo+ICsrKyBiL2RyaXZlcnMvdGhlcm1hbC9pbnRlbC9pbnQzNDB4X3RoZXJtYWwvaW50
MzQwMF90aGVybWFsLmMNCj4gQEAgLTM2OSw2ICszNjksNyBAQCBzdGF0aWMgaW50IGludDM0MDBf
dGhlcm1hbF9yZW1vdmUoc3RydWN0DQo+IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIH0NCj4g
IA0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBhY3BpX2RldmljZV9pZCBpbnQzNDAwX3RoZXJtYWxf
bWF0Y2hbXSA9IHsNCj4gKwl7IklOVDEwNDAiLCAwfSwNCj4gIAl7IklOVDM0MDAiLCAwfSwNCj4g
IAl7fQ0KPiAgfTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdGhlcm1hbC9pbnRlbC9pbnQzNDB4
X3RoZXJtYWwvaW50MzQwM190aGVybWFsLmMNCj4gYi9kcml2ZXJzL3RoZXJtYWwvaW50ZWwvaW50
MzQweF90aGVybWFsL2ludDM0MDNfdGhlcm1hbC5jDQo+IGluZGV4IGE3YmJkODU4NGFlMi4uYWVl
Y2UxZTEzNmE1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3RoZXJtYWwvaW50ZWwvaW50MzQweF90
aGVybWFsL2ludDM0MDNfdGhlcm1hbC5jDQo+ICsrKyBiL2RyaXZlcnMvdGhlcm1hbC9pbnRlbC9p
bnQzNDB4X3RoZXJtYWwvaW50MzQwM190aGVybWFsLmMNCj4gQEAgLTI4Miw2ICsyODIsNyBAQCBz
dGF0aWMgaW50IGludDM0MDNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UNCj4gKnBkZXYp
DQo+ICB9DQo+ICANCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYWNwaV9kZXZpY2VfaWQgaW50MzQw
M19kZXZpY2VfaWRzW10gPSB7DQo+ICsJeyJJTlQxMDQzIiwgMH0sDQo+ICAJeyJJTlQzNDAzIiwg
MH0sDQo+ICAJeyIiLCAwfSwNCj4gIH07DQo=
