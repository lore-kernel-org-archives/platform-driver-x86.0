From: "R, Durgadoss" <durgadoss.r@intel.com>
Subject: RE: [PATCH 4/5] intel_mid_thermal: Use struct dev_pm_ops for power
 management
Date: Mon, 18 Jun 2012 06:03:16 +0000
Message-ID: <4D68720C2E767A4AA6A8796D42C8EB59143300@BGSMSX101.gar.corp.intel.com>
References: <201206172226.42729.rjw@sisk.pl> <201206172229.41550.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:51186 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750911Ab2FRGDV (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 18 Jun 2012 02:03:21 -0400
In-Reply-To: <201206172229.41550.rjw@sisk.pl>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@sisk.pl>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, LKML <linux-kernel@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Joey Lee <jlee@novell.com>

VGhhbmtzIFJhZmFlbCBmb3IgdGhlIHBhdGNoLg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+IEZyb206IHBsYXRmb3JtLWRyaXZlci14ODYtb3duZXJAdmdlci5rZXJuZWwub3JnIFtt
YWlsdG86cGxhdGZvcm0tZHJpdmVyLXg4Ni0NCj4gb3duZXJAdmdlci5rZXJuZWwub3JnXSBPbiBC
ZWhhbGYgT2YgUmFmYWVsIEouIFd5c29ja2kNCj4gU2VudDogTW9uZGF5LCBKdW5lIDE4LCAyMDEy
IDI6MDAgQU0NCj4gVG86IHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnDQo+IENj
OiBIZW5yaXF1ZSBkZSBNb3JhZXMgSG9sc2NodWg7IExLTUw7IExpbnV4IFBNIGxpc3Q7IE1hdHRo
ZXcgR2FycmV0dDsgSm9leQ0KPiBMZWUNCj4gU3ViamVjdDogW1BBVENIIDQvNV0gaW50ZWxfbWlk
X3RoZXJtYWw6IFVzZSBzdHJ1Y3QgZGV2X3BtX29wcyBmb3IgcG93ZXINCj4gbWFuYWdlbWVudA0K
PiANCj4gRnJvbTogUmFmYWVsIEouIFd5c29ja2kgPHJqd0BzaXNrLnBsPg0KPiANCj4gTWFrZSB0
aGUgaW50ZWxfbWlkX3RoZXJtYWwgZHJpdmVyIGRlZmluZSBpdHMgUE0gY2FsbGJhY2tzIHRocm91
Z2gNCj4gYSBzdHJ1Y3QgZGV2X3BtX29wcyBvYmplY3QgcmF0aGVyIHRoYW4gYnkgdXNpbmcgbGVn
YWN5IFBNIGhvb2tzDQo+IGluIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIuDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBSYWZhZWwgSi4gV3lzb2NraSA8cmp3QHNpc2sucGw+DQoNClJldmlld2VkLWJ5OiBE
dXJnYWRvc3MgUiA8ZHVyZ2Fkb3NzLnJAaW50ZWwuY29tPg0KDQpUaGFua3MsDQpEdXJnYQ0K
