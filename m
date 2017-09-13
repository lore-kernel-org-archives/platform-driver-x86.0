From: "Chakravarty, Souvik K" <souvik.k.chakravarty@intel.com>
Subject: RE: [PATCH v2] drivers:platform/x86:Use ARRAY_SIZE() for the size
 calculation of the array.
Date: Wed, 13 Sep 2017 10:17:24 +0000
Message-ID: <5F7315E704FA0841B5DFCE90329B2BB4661DAD1D@BGSMSX102.gar.corp.intel.com>
References: <1505292855-27476-1-git-send-email-allen.lkml@gmail.com>
 <874ls6kjbw.fsf@miraculix.mork.no>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:28189 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752248AbdIMKRj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Sep 2017 06:17:39 -0400
In-Reply-To: <874ls6kjbw.fsf@miraculix.mork.no>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?B?QmrDuHJuIE1vcms=?= <bjorn@mork.no>, Allen Pais <allen.lkml@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogcGxhdGZvcm0tZHJpdmVy
LXg4Ni1vd25lckB2Z2VyLmtlcm5lbC5vcmcgW21haWx0bzpwbGF0Zm9ybS1kcml2ZXItDQo+IHg4
Ni1vd25lckB2Z2VyLmtlcm5lbC5vcmddIE9uIEJlaGFsZiBPZiBCasO4cm4gTW9yaw0KPiBTZW50
OiBXZWRuZXNkYXksIFNlcHRlbWJlciAxMywgMjAxNyAzOjMyIFBNDQo+IFRvOiBBbGxlbiBQYWlz
IDxhbGxlbi5sa21sQGdtYWlsLmNvbT4NCj4gQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmc7IENoYWtyYXZhcnR5LCBTb3V2aWsgSw0KPiA8c291dmlrLmsuY2hha3JhdmFydHlAaW50ZWwu
Y29tPjsgcGxhdGZvcm0tZHJpdmVyLXg4NkB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6
IFtQQVRDSCB2Ml0gZHJpdmVyczpwbGF0Zm9ybS94ODY6VXNlIEFSUkFZX1NJWkUoKSBmb3IgdGhl
IHNpemUNCj4gY2FsY3VsYXRpb24gb2YgdGhlIGFycmF5Lg0KPiANCj4gQWxsZW4gUGFpcyA8YWxs
ZW4ubGttbEBnbWFpbC5jb20+IHdyaXRlczoNCj4gDQo+ID4gU2lnbmVkLW9mZi1ieTogQWxsZW4g
UGFpcyA8YWxsZW4ubGttbEBnbWFpbC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvcGxhdGZv
cm0veDg2L2ludGVsX3RlbGVtZXRyeV9kZWJ1Z2ZzLmMgfCAyICstDQo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsX3RlbGVtZXRyeV9kZWJ1Z2ZzLmMNCj4gPiBiL2Ry
aXZlcnMvcGxhdGZvcm0veDg2L2ludGVsX3RlbGVtZXRyeV9kZWJ1Z2ZzLmMNCj4gPiBpbmRleCBk
NGZjNDJiLi42YjYzYjNkIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L2lu
dGVsX3RlbGVtZXRyeV9kZWJ1Z2ZzLmMNCj4gPiArKysgYi9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9p
bnRlbF90ZWxlbWV0cnlfZGVidWdmcy5jDQo+ID4gQEAgLTc2LDcgKzc2LDcgQEANCj4gPiAgI2Rl
ZmluZSBURUxFTV9JT1NTX0RYX0QwSVhfRVZUUwkJMjUNCj4gPiAgI2RlZmluZSBURUxFTV9JT1NT
X1BHX0VWVFMJCTMwDQo+ID4NCj4gPiAtI2RlZmluZSBURUxFTV9FVlRfTEVOKHgpIChzaXplb2Yo
eCkvc2l6ZW9mKCh4KVswXSkpDQo+ID4gKyNkZWZpbmUgVEVMRU1fRVZUX0xFTih4KSBBUlJBWV9T
SVpFKHgpDQo+ID4NCj4gPiAgI2RlZmluZSBURUxFTV9ERUJVR0ZTX0NQVShtb2RlbCwgZGF0YSkg
XA0KPiA+ICAJeyBYODZfVkVORE9SX0lOVEVMLCA2LCBtb2RlbCwgWDg2X0ZFQVRVUkVfQU5ZLCAo
dW5zaWduZWQNCj4gbG9uZykmZGF0YX0NCj4gDQo+IFdoYXQncyB0aGUgcG9pbnQ/ICBXaHkgbm90
IHNpbXBseSByZXBsYWNlIGFsbCBpbnN0YW5jZXMgb2YgVEVMRU1fRVZUX0xFTg0KPiB3aXRoIEFS
UkFZX1NJWkU/DQpJIHdhcyBhYm91dCB0byBzYXkgdGhpcyB0b28sIGFsdGhvdWdoIEkgc2hvdWxk
IGhhdmUgcHJvYmFibHkgc2FpZCB0aGlzIGluIHRoZSBmaXJzdCBzcGluIGl0c2VsZi4NCg0KPiAN
Cj4gDQo+IA0KPiBCasO4cm4NCg==
