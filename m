From: Matthew Garrett <matthew.garrett@nebula.com>
Subject: Re: [PATCH]hp_wmi: Fix unregister order in hp_wmi_rfkill_setup()
Date: Tue, 3 Sep 2013 12:14:23 +0000
Message-ID: <1378210462.11730.12.camel@x230>
References: <3838581375104877@web14g.yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bl2lp0211.outbound.protection.outlook.com ([207.46.163.211]:12833
	"EHLO na01-bl2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1759989Ab3ICMO0 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 3 Sep 2013 08:14:26 -0400
In-Reply-To: <3838581375104877@web14g.yandex.ru>
Content-Language: en-US
Content-ID: <661280D87687324D8B3EB6F0BAA3A742@namprd05.prod.outlook.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Kirill Tkhai <tkhai@yandex.ru>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

T24gTW9uLCAyMDEzLTA3LTI5IGF0IDE3OjM0ICswNDAwLCBLaXJpbGwgVGtoYWkgd3JvdGU6DQo+
IFJlZ2lzdGVyIG9yZGVyIGlzOg0KPiAgICAgICAgICAgICAgICAgICAgICAgICB3aWZpDQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIGJsdWV0b290aA0KPiAgICAgICAgICAgICAgICAgICAgICAg
ICB3d2FuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGdwcw0KPiANCj4gU28gdW5yZWdpc3Rl
ciBvcmRlciBtdXN0IGJlOg0KPiAgICAgICAgICAgICAgICAgICAgICAgICBncHMNCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgd3dhbg0KPiAgICAgICAgICAgICAgICAgICAgICAgICBibHVldGlp
dGgNCj4gICAgICAgICAgICAgICAgICAgICAgICAgd2lmaQ0KPiANCj4gQnV0IGN1cnJlbnRseSBn
cHMgYW5kIHd3YW4gYXJlIHN3YXBwZWQuIEZpeCB0aGF0Lg0KPiBBbHNvIGZpeCBnb3RvIGxpbmtz
Lg0KDQpBcHBsaWVkLCB0aGFua3MuDQoNCi0tIA0KTWF0dGhldyBHYXJyZXR0IDxtYXR0aGV3Lmdh
cnJldHRAbmVidWxhLmNvbT4NCg==
