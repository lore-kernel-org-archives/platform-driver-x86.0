From: "Bernat, Yehezkel" <yehezkel.bernat@intel.com>
Subject: Re: Fwd: [PATCH] Add driver to force WMI Thunderbolt controller power
 status
Date: Wed, 6 Sep 2017 22:34:02 +0000
Message-ID: <1504737247.2677.170.camel@intel.com>
References: <1504720440-24423-1-git-send-email-mario.limonciello@dell.com>
         <CA+CmpXt9EtzObijHT3gmm=xUwFDF3Ec=SFbNnPAk+oRdzAUADQ@mail.gmail.com>
         <1504726863.2677.154.camel@intel.com>
         <b74a2237da254faea0377fdcb93aa3e0@ausx13mpc120.AMER.DELL.COM>
         <20170906200953.GA8298@fury> <1504729603.2677.167.camel@intel.com>
         <7edd73cbe3ba4d7b80a6614e93f4d538@ausx13mpc120.AMER.DELL.COM>
         <20170906222730.GB8298@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:10324 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932603AbdIFWeH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 Sep 2017 18:34:07 -0400
In-Reply-To: <20170906222730.GB8298@fury>
Content-Language: en-US
Content-ID: <0E44F2152618A24E9CC5D0F8CE1408A6@namprd11.prod.outlook.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "dvhart@infradead.org" <dvhart@infradead.org>, "Mario.Limonciello@dell.com" <Mario.Limonciello@dell.com>
Cc: "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "hughsient@gmail.com" <hughsient@gmail.com>

T24gV2VkLCAyMDE3LTA5LTA2IGF0IDE1OjI3IC0wNzAwLCBEYXJyZW4gSGFydCB3cm90ZToNCj4g
T24gV2VkLCBTZXAgMDYsIDIwMTcgYXQgMDk6NDA6MDJQTSArMDAwMCwgTWFyaW8uTGltb25jaWVs
bG9AZGVsbC5jb20NCj4gd3JvdGU6DQo+ID4gDQo+ID4gPiANCj4gPiA+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBCZXJuYXQsIFllaGV6a2VsIFttYWlsdG86eWVoZXpr
ZWwuYmVybmF0QGludGVsLmNvbV0NCj4gPiA+IFNlbnQ6IFdlZG5lc2RheSwgU2VwdGVtYmVyIDYs
IDIwMTcgMzoyNyBQTQ0KPiA+ID4gVG86IGR2aGFydEBpbmZyYWRlYWQub3JnOyBMaW1vbmNpZWxs
bywgTWFyaW8gPE1hcmlvX0xpbW9uY2llbGxvQEQNCj4gPiA+IGVsbC5jb20+DQo+ID4gPiBDYzog
bWlrYS53ZXN0ZXJiZXJnQGxpbnV4LmludGVsLmNvbTsgbGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZw0KPiA+ID4gOyBwbGF0Zm9ybS0NCj4gPiA+IGRyaXZlci14ODZAdmdlci5rZXJuZWwub3Jn
OyBodWdoc2llbnRAZ21haWwuY29tDQo+ID4gPiBTdWJqZWN0OiBSZTogRndkOiBbUEFUQ0hdIEFk
ZCBkcml2ZXIgdG8gZm9yY2UgV01JIFRodW5kZXJib2x0DQo+ID4gPiBjb250cm9sbGVyIHBvd2Vy
DQo+ID4gPiBzdGF0dXMNCj4gPiA+IA0KPiA+ID4gT24gV2VkLCAyMDE3LTA5LTA2IGF0IDEzOjA5
IC0wNzAwLCBEYXJyZW4gSGFydCB3cm90ZToNCj4gPiA+ID4gDQo+ID4gPiA+IFRoZSBvdGhlciBx
dWVzdGlvbiBJIGhhZCBhYm91dCB0aGlzIHdhcyBpZiB0aGUgdHlwaWNhbCB1c2UgY2FzZQ0KPiA+
ID4gPiBpbnZvbHZlcyB0aGUgT1MsDQo+ID4gPiA+IG9yIGlmIHRoZSBmaXJtd2FyZSB1cGRhdGUg
KGZvciBleGFtcGxlKSB3b3VsZCBiZSBwZXJmb3JtZWQgYXMNCj4gPiA+ID4gcGFydCBvZg0KPiA+
ID4gPiB0aGUNCj4gPiA+ID4gZ2VuZXJhbCBwbGF0Zm9ybSBmaXJtd2FyZSB1cGRhdGUgKGZyb20g
dGhlIFVFRkkgdXBkYXRlDQo+ID4gPiA+IHV0aWxpdHkpLg0KPiA+ID4gRmlyc3QsIHRoZXJlIGlz
IHRoZSB1c2UtY2FzZSBvZiBhZGQtaW4gY2FyZCwgd2hlcmUgaXQncw0KPiA+ID4gaW1wb3NzaWJs
ZSB0bw0KPiA+ID4gdXNlIFVFRkktYmFzZWQgdXBkYXRlLCBhcyBtdWNoIGFzIEkgdW5kZXJzdGFu
ZCwgYXMgdGhlIEJJT1MgaXNuJ3QNCj4gPiA+IGV4cGVjdGVkIHRvIGV4cG9zZSBhbiBFU1JUIGVu
dHJ5IGZvciBpdC4NCj4gPiA+IA0KPiA+ID4gRXZlbiBmb3IgYnVpbHQtaW4gY29udHJvbGxlciwg
bXkgaW1wcmVzc2lvbiBpcyB0aGF0IG1vc3QgT0VNcyB1c2UNCj4gPiA+IGEgRlcNCj4gPiA+IHVw
ZGF0ZSBhcHBsaWNhdGlvbiAocnVubmluZyBvbiBXaW5kb3dzKSBhbmQgYXJlIG5vdCBwdWJsaXNo
aW5nIGENCj4gPiA+IFVFRkktDQo+ID4gPiBiYXNlZCBzb2x1dGlvbi4NCj4gPiBZZWFoIEknZCBh
Z3JlZSB3aXRoIHRoYXQgaW1wcmVzc2lvbi4NCj4gPiANCj4gPiBFdmVuIGlmIGFuIE9FTSBkb2Vz
IGNob29zZSB0byBwdWJsaXNoIGEgVUVGSSBiYXNlZCBzb2x1dGlvbiwgaXQncw0KPiA+IHN0aWxs
DQo+ID4gdXNlZnVsIHRvIHByZXNlbnQgRlcgaW5mb3JtYXRpb24gZm9yIHRoZSBUQlQgY29udHJv
bGxlciBpbiBmd3VwZA0KPiA+IGhvd2V2ZXIgdG9vLg0KPiA+IA0KPiA+IFNpbWlsYXIgdG8gaG93
IGZ3dXBkIGRpc3BsYXlzIHRoZSBpbmZvcm1hdGlvbiBmb3IgdGhlIE1FIGV2ZW4NCj4gPiB0aG91
Z2gNCj4gPiB0aGUgTUUgaXMgdHlwaWNhbGx5IHVwZGF0ZWQgdmlhIFVFRkkuDQo+IFNvIHRoaXMg
cmFpc2VzIHRoZSBxdWVzdGlvbjogY2FuIHdlIGNvbWUgdXAgd2l0aCBhIG1lY2hhbmlzbSBhcyBw
YXJ0DQo+IG9mIHRoZSB0Yg0KPiBkcml2ZXIgdGhhdCB3aWxsIHdvcmsgb24gYm90aCBvbi1ib2Fy
ZCBjb250cm9sbGVycyBhbmQgYWRkIG9uIGNhcmRzPw0KPiBJbiBpdCdzDQo+IGN1cnJlbnQgZm9y
bSwgdGhpcyBkcml2ZXIgd2lsbCBvbmx5IGFkZHJlc3Mgb24tYm9hcmQgY29udHJvbGxlcnMuDQoN
CkJvdGggdGhpcyB3bWkgZHJpdmVyIGFuZCBUaHVuZGVyYm9sdCBkcml2ZXIgYXJlIHJlbGV2YW50
IGZvciBib3RoIG9uLQ0KYm9hcmQgY29udHJvbGxlcnMgYW5kIGFkZC1pbiBjYXJkcy4NCk1heWJl
IEknbSBtaXNzaW5nIHNvbWV0aGluZy4gV291bGQgeW91IG1pbmQgdG8gZWxhYm9yYXRlPw0KDQo+
IA0KPiBUaGUgVEIgZHJpdmVyIGNvdWxkIHVzZSB0aGUgV01JIG1ldGhvZCBpZiBpdCBleGlzdHMs
IG9yIHNvbWUgb3RoZXINCj4gbWV0aG9kIHRvDQo+IHBvd2VyIGl0IHVwLCBidXQgcHJlc2VudCB0
aGUgc2FtZSBzeXNmcyBpbnRlcmZhY2UgdG8gdXNlcnNwYWNlLi4uDQo+IA0K
