From: Matthew Garrett <matthew.garrett@nebula.com>
Subject: Re: [PATCH 3/4] driver: provide sysfs interfaces to access TXT log
Date: Wed, 8 May 2013 05:16:43 +0000
Message-ID: <1367990202.2425.26.camel@x230>
References: <1367938519-840-1-git-send-email-qiaowei.ren@intel.com>
	 <1367938519-840-4-git-send-email-qiaowei.ren@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]:9756 "EHLO
	tx2outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751088Ab3EHFQv (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 8 May 2013 01:16:51 -0400
In-Reply-To: <1367938519-840-4-git-send-email-qiaowei.ren@intel.com>
Content-Language: en-US
Content-ID: <61966D219BF4B646874C4D67E97F1619@namprd05.prod.outlook.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Qiaowei Ren <qiaowei.ren@intel.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Xiaoyan Zhang <xiaoyan.zhang@intel.com>, Gang Wei <gang.wei@intel.com>

T24gVHVlLCAyMDEzLTA1LTA3IGF0IDIyOjU1ICswODAwLCBRaWFvd2VpIFJlbiB3cm90ZToNCg0K
PiArV2hhdDoJCS9zeXMvZGV2aWNlcy9wbGF0Zm9ybS9pbnRlbF90eHQvbG9nL2xvZ19oZWFkZXIN
Cj4gK0RhdGU6CQlNYXkgMjAxMw0KPiArS2VybmVsVmVyc2lvbjoJMy45DQoNCkhvdyBkaWZmZXJl
bnQgYXJlIHRoZXNlIGxvZ3MgdG8gdGhlIFRQTSBtZWFzdXJlbWVudHMgZXhwb3J0ZWQgdmlhDQpz
ZWN1cml0eWZzPw0KDQo+ICtXaGF0OgkJL3N5cy9kZXZpY2VzL3BsYXRmb3JtL2ludGVsX3R4dC9s
b2cvYmxvY2tfaW5kZXgNCj4gK0RhdGU6CQlNYXkgMjAxMw0KPiArS2VybmVsVmVyc2lvbjoJMy45
DQo+ICtDb250YWN0OgkiUWlhb3dlaSBSZW4iIDxxaWFvd2VpLnJlbkBpbnRlbC5jb20+DQo+ICtE
ZXNjcmlwdGlvbjoJVGhlICJibG9ja19pbmRleCIgcHJvcGVydHkgYWxsb3dzIHlvdSB0byBzZXQg
dGhlIGJsb2NrDQo+ICsJCWluZGV4IGZvciBvdXRwdXQuDQoNClNvIEkgd3JpdGUgYSB2YWx1ZSBo
ZXJlIGFuZCB0aGVuIEkgc2VlIGRpZmZlcmVudCBjaHVua3Mgb2YgbG9nPyBUaGlzDQpkb2Vzbid0
IHNlZW0gbGlrZSBhbiBvcHRpbWFsIGludGVyZmFjZS4gV2hhdCBkbyB0aGVzZSBsb2dzIGFjdHVh
bGx5DQpjb250YWluPyBIb3cgZG8gSSBrbm93IHdoaWNoIGJsb2NrIEkgc2hvdWxkIGJlIHJlYWRp
bmc/DQoNCj4gK3N0YXRpYyBpbnQgYXJlX3V1aWRzX2VxdWFsKGNvbnN0IHN0cnVjdCB1dWlkICp1
dWlkMSwNCj4gKwkJCSAgIGNvbnN0IHN0cnVjdCB1dWlkICp1dWlkMikNCj4gK3sNCj4gKwlyZXR1
cm4gKG1lbWNtcCh1dWlkMSwgdXVpZDIsIHNpemVvZigqdXVpZDEpKSA9PSAwKSA/IDEgOiAwOw0K
PiArfQ0KDQpVc2Ugb25lIG9mIHRoZSB1dWlkY21wIGZ1bmN0aW9ucyBmcm9tIHV1aWQuaD8NCg0K
PiArRVhQT1JUX1NZTUJPTF9HUEwoc3lzZnNfY3JlYXRlX2xvZyk7DQo+ICsNCj4gK01PRFVMRV9M
SUNFTlNFKCJHUEwiKTsNCg0KU2FtZSBhcyBmb3IgdGhlIHByZXZpb3VzIHBhdGNoIC0geW91IGRv
bid0IG5lZWQgdGhlc2UuDQoNCj4gK3N0cnVjdCB1dWlkIHsNCj4gKwl1aW50MzJfdCBkYXRhMTsN
Cj4gKwl1aW50MTZfdCBkYXRhMjsNCj4gKwl1aW50MTZfdCBkYXRhMzsNCj4gKwl1aW50MTZfdCBk
YXRhNDsNCj4gKwl1aW50OF90ICBkYXRhNVs2XTsNCj4gK30gX19wYWNrZWQ7DQoNClRoZXJlJ3Mg
YWxyZWFkeSBVVUlEIHN0cnVjdHVyZXMgaW4gdXVpZC5oDQoNCj4gKyNkZWZpbmUgVEJPT1RfTE9H
X1VVSUQJCXsweGMwMTkyNTI2LCAweDZiMzAsIDB4NGRiNCwgMHg4NDRjLCBcDQo+ICsJCQkJezB4
YTMsIDB4ZTksIDB4NTMsIDB4YjgsIDB4ODEsIDB4NzR9IH0NCg0KdXVpZC5oIGFnYWluLg0KDQot
LSANCk1hdHRoZXcgR2FycmV0dCB8IG1qZzU5QHNyY2YudWNhbS5vcmcNCg==
