From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v6 13/14] platform/x86: wmi: create character devices when
 requested by drivers
Date: Tue, 10 Oct 2017 19:24:11 +0000
Message-ID: <a8de75f5894f4b888e3ca16fea6c308a@ausx13mpc120.AMER.DELL.COM>
References: <cover.1507589249.git.mario.limonciello@dell.com>
 <897883f9b8c45dc2cb24de1bb4642513734852d3.1507589249.git.mario.limonciello@dell.com>
 <20171010191130.5octjwhbxouayxfv@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa1.dell-outbound.iphmx.com ([68.232.153.90]:27441 "EHLO
        esa1.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753822AbdJJTYN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 10 Oct 2017 15:24:13 -0400
In-Reply-To: <20171010191130.5octjwhbxouayxfv@pali>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: pali.rohar@gmail.com
Cc: dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, greg@kroah.com

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQYWxpIFJvaMOhciBbbWFpbHRv
OnBhbGkucm9oYXJAZ21haWwuY29tXQ0KPiBTZW50OiBUdWVzZGF5LCBPY3RvYmVyIDEwLCAyMDE3
IDI6MTIgUE0NCj4gVG86IExpbW9uY2llbGxvLCBNYXJpbyA8TWFyaW9fTGltb25jaWVsbG9ARGVs
bC5jb20+DQo+IENjOiBkdmhhcnRAaW5mcmFkZWFkLm9yZzsgQW5keSBTaGV2Y2hlbmtvIDxhbmR5
LnNoZXZjaGVua29AZ21haWwuY29tPjsNCj4gTEtNTCA8bGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZz47IHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnOw0KPiBBbmR5IEx1dG9t
aXJza2kgPGx1dG9Aa2VybmVsLm9yZz47IHF1YXNpc2VjQGdvb2dsZS5jb207IHJqd0Byand5c29j
a2kubmV0Ow0KPiBtamc1OUBnb29nbGUuY29tOyBoY2hAbHN0LmRlOyBHcmVnIEtIIDxncmVnQGty
b2FoLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NiAxMy8xNF0gcGxhdGZvcm0veDg2OiB3
bWk6IGNyZWF0ZSBjaGFyYWN0ZXIgZGV2aWNlcyB3aGVuDQo+IHJlcXVlc3RlZCBieSBkcml2ZXJz
DQo+IA0KPiBPbiBNb25kYXkgMDkgT2N0b2JlciAyMDE3IDE3OjUxOjUxIE1hcmlvIExpbW9uY2ll
bGxvIHdyb3RlOg0KPiA+ICsJLyogbWFrZSBzdXJlIHdlJ3JlIG5vdCBjYWxsaW5nIGEgaGlnaGVy
IGluc3RhbmNlIHRoYW4gZXhpc3RzKi8NCj4gPiArCWlmIChfSU9DX05SKGNtZCkgPiB3YmxvY2st
PmdibG9jay5pbnN0YW5jZV9jb3VudCAtIDEpDQo+ID4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+IA0K
PiBJcyB0aGlzIGNvbmRpdGlvbiByZWFsbHkgd29ya2luZz8gaW5zdGFuY2VfY291bnQgaXMgdW5z
aWduZWQsIGNtZCBpcw0KPiBhbHNvIHVuc2lnbmVkLi4uIGFuZCB3aGVuIGluc3RhbmNlX2NvdW50
IGlzIHplcm8sIHRoZW4gSUlSQyBlcnJvciB3b3VsZA0KPiBub3QgYmUgdGhyb3duLg0KPiANCg0K
QnV0IGluc3RhbmNlIGNvdW50IGNhbid0IGJlIHplcm8uICBNT0Ygd291bGQgZmFsbCBhcGFydCB3
aXRoIGEgemVybyBpbnN0YW5jZSBjb3VudC4NCklmIGEgYnJva2VuIEJJT1Mgd2FzIHNoaXBwZWQg
d2l0aCBhbiBpbnN0YW5jZSBjb3VudCBvZiB6ZXJvIGJpZ2dlciBwcm9ibGVtcyB3b3VsZA0KaGF2
ZSBoYXBwZW5lZC4NCg==
