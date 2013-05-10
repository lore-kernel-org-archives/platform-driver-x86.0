From: "Ren, Qiaowei" <qiaowei.ren@intel.com>
Subject: RE: [PATCH 1/4] driver: add TXT driver in kernel
Date: Fri, 10 May 2013 03:38:05 +0000
Message-ID: <9E0BE1322F2F2246BD820DA9FC397ADE9AC855@SHSMSX102.ccr.corp.intel.com>
References: <1367938519-840-1-git-send-email-qiaowei.ren@intel.com>
	 <1367938519-840-2-git-send-email-qiaowei.ren@intel.com>
 <1367980339.2425.7.camel@x230>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga14.intel.com ([143.182.124.37]:50288 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751042Ab3EJDiK (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 9 May 2013 23:38:10 -0400
In-Reply-To: <1367980339.2425.7.camel@x230>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "Wei, Gang" <gang.wei@intel.com>

T24gMjAxMy0wNS0wOCwgTWF0dGhldyBHYXJyZXR0IHdyb3RlOg0KPiBPbiBUdWUsIDIwMTMtMDUt
MDcgYXQgMjI6NTUgKzA4MDAsIFFpYW93ZWkgUmVuIHdyb3RlOg0KPiANCj4gPiArICogVGhpcyBt
b2R1bGUgaXMgZXhwZWN0ZWQgdG8gYmUgYSBiZXR0ZXIgdG9vbCB0byBhY2Nlc3MgYmVsb3cNCj4g
PiArIHJlc291cmNlcw0KPiANCj4gRXhwZWN0ZWQgdG8gYmUgb3IgaXM/IDopDQoNCiJpcyIgOikN
Cg0KPiA+ICsgKiBEYXRhIGlzIGN1cnJlbnRseSBmb3VuZCBiZWxvdw0KPiANCj4gWW91J3JlIGFk
ZGluZyBpdCB0byBBQkksIHNvIGl0IHNob3VsZG4ndCBqdXN0IGJlIGN1cnJlbnQgLSBhcmUgeW91
IHBsYW5uaW5nIG9uDQo+IG1vdmluZyBpdCBhdCBhbnkgcG9pbnQ/IElzIHRoaXMgZnVuY3Rpb25h
bGl0eSB0aGF0IHNob3VsZCBiZSB1bmRlciBzZWN1cml0eWZzDQo+IGluc3RlYWQ/DQo+IA0KPiA+
ICsJdHh0X3BkZXYgPSBwbGF0Zm9ybV9kZXZpY2VfcmVnaXN0ZXJfc2ltcGxlKERFVl9OQU1FLCAt
MSwgTlVMTCwgMCk7DQo+IA0KPiBUaGlzIHdpbGwgcmVnaXN0ZXIgZXZlbiBpZiB0aGVyZSdzIG5v
IFRYVCBzdXBwb3J0IG9uIHRoZSBwbGF0Zm9ybSwgcmlnaHQ/IElzIHRoZXJlDQo+IG5vIG1lY2hh
bmlzbSBmb3IgZGV0ZXJtaW5pbmcgd2hldGhlciBhIHBsYXRmb3JtIGhhcyBUWFQgc3VwcG9ydCBi
ZWZvcmUNCj4gcmVnaXN0ZXJpbmcgYSBkZXZpY2U/DQo+IA0KPiA+ICttb2R1bGVfaW5pdCh0eHRf
c3lzZnNfaW5pdCk7DQo+ID4gK21vZHVsZV9leGl0KHR4dF9zeXNmc19leGl0KTsNCj4gDQo+IEFu
ZCB5b3UndmUgZ290IG5vIG1vZHVsZSBhbGlhc2VzLCBzbyB0aGlzIHdpbGwgbmV2ZXIgYmUgYXV0
b2xvYWRlZC4gSG93IGRvZXMNCj4gdGhlIE9TIGtub3cgdGhhdCB0aGUgcGxhdGZvcm0gaW1wbGVt
ZW50cyBUWFQ/DQoNCkN1cnJlbnRseSB0aGlzIGRyaXZlciBvbmx5IGRlcGVuZHMgb24gQ09ORklH
X0lOVEVMX1RYVCwgd2hpY2ggaXMgdGhlIGtlcm5lbCBvcHRpb24gZm9yIGVuYWJsaW5nIEludGVs
IFRYVCBzdXBwb3J0LiBBbmQgdGhlcmUgaXMgbm8gZXhwbGljaXQgaW50ZXJmYWNlIHRvIGNoZWNr
IHdoZXRoZXIgdHh0IGlzIHN1cHBvcnRlZCBpbiB0aGlzIHR4dCBlbmFibGluZyBwYXJ0IG9mIGtl
cm5lbC4gQnV0IHNpbmNlIHRoZSB0Ym9vdCBjb2RlIHdpbGwgZGV0ZWN0IHdoZXRoZXIgdGhlIHBs
YXRmb3JtIGFjdHVhbGx5IHN1cHBvcnRzIEludGVsIFRYVCwgYW5kIHNvIHRib290X2VuYWJsZWQo
KSBpbiBpbmNsdWRlL2xpbnV4L3Rib290LmggbWF5IGJlIHVzZWQgdG8gZGV0ZXJtaW5lIHdoZXRo
ZXIgYSBwbGF0Zm9ybSBoYXMgVFhUIHN1cHBvcnQuDQoNCkluIGZhY3QsIHdlIG1heSBhbHNvIGNo
ZWNrIENQVSBmZWF0dXJlIEVDWFs2XSAoU01YKSBmb3IgdGhpcyBwdXJwb3NlLg0KDQpUaGFua3Ms
DQpRaWFvd2VpDQoNCg==
