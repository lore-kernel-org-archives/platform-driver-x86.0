From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v2] platform/x86: dell-laptop: Allocate buffer on heap
 rather than globally
Date: Mon, 5 Feb 2018 16:49:35 +0000
Message-ID: <9b01161fb81043b79cf9ade8ec348fff@ausx13mpc120.AMER.DELL.COM>
References: <1517420855-19374-1-git-send-email-mario.limonciello@dell.com>
 <20180204120922.fds52i22griw2h6e@pali>
 <CAHp75VcnDKP=kNPh7pU1v_f0+oP64ByKAOmkZzXNUVaXg=wDSg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa4.dell-outbound.iphmx.com ([68.232.149.214]:56083 "EHLO
        esa4.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752986AbeBEQth (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 5 Feb 2018 11:49:37 -0500
In-Reply-To: <CAHp75VcnDKP=kNPh7pU1v_f0+oP64ByKAOmkZzXNUVaXg=wDSg@mail.gmail.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: andy.shevchenko@gmail.com, pali.rohar@gmail.com
Cc: dvhart@infradead.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmR5IFNoZXZjaGVua28gW21h
aWx0bzphbmR5LnNoZXZjaGVua29AZ21haWwuY29tXQ0KPiBTZW50OiBTdW5kYXksIEZlYnJ1YXJ5
IDQsIDIwMTggODoyOCBBTQ0KPiBUbzogUGFsaSBSb2jDoXIgPHBhbGkucm9oYXJAZ21haWwuY29t
Pg0KPiBDYzogTGltb25jaWVsbG8sIE1hcmlvIDxNYXJpb19MaW1vbmNpZWxsb0BEZWxsLmNvbT47
IERhcnJlbiBIYXJ0DQo+IDxkdmhhcnRAaW5mcmFkZWFkLm9yZz47IExLTUwgPGxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmc+OyBQbGF0Zm9ybSBEcml2ZXINCj4gPHBsYXRmb3JtLWRyaXZlci14
ODZAdmdlci5rZXJuZWwub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyXSBwbGF0Zm9ybS94
ODY6IGRlbGwtbGFwdG9wOiBBbGxvY2F0ZSBidWZmZXIgb24gaGVhcCByYXRoZXINCj4gdGhhbiBn
bG9iYWxseQ0KPiANCj4gT24gU3VuLCBGZWIgNCwgMjAxOCBhdCAyOjA5IFBNLCBQYWxpIFJvaMOh
ciA8cGFsaS5yb2hhckBnbWFpbC5jb20+IHdyb3RlOg0KPiA+IE9uIFdlZG5lc2RheSAzMSBKYW51
YXJ5IDIwMTggMTE6NDc6MzUgTWFyaW8gTGltb25jaWVsbG8gd3JvdGU6DQo+ID4+IFRoZXJlIGlz
IG5vIGxvbmdlciBhIG5lZWQgZm9yIHRoZSBidWZmZXIgdG8gYmUgZGVmaW5lZCBpbg0KPiA+PiBm
aXJzdCA0R0IgcGh5c2ljYWwgYWRkcmVzcyBzcGFjZS4NCj4gPj4NCj4gPj4gRnVydGhlcm1vcmUg
dGhlcmUgbWF5IGJlIHJhY2UgY29uZGl0aW9ucyB3aXRoIG11bHRpcGxlIGRpZmZlcmVudCBmdW5j
dGlvbnMNCj4gPj4gd29ya2luZyBvbiBhIG1vZHVsZSB3aWRlIGJ1ZmZlciBjYXVzaW5nIGluY29y
cmVjdCByZXN1bHRzLg0KPiA+Pg0KPiA+PiBGaXhlczogNTQ5YjQ5MzBmMDU3NjU4ZGM1MGQ4MDEw
ZTY2MjE5MjMzMTE5YTRkOA0KPiANCj4gSGUtaCwgSSBoYWQgdG8gbm90aWNlIHRoaXMgZWFybGll
ci4uLg0KPiANCj4gPiBPaywgeW91IGNhbiBhZGQgbXk6DQo+ID4gUmV2aWV3ZWQtYnk6IFBhbGkg
Um9ow6FyIDxwYWxpLnJvaGFyQGdtYWlsLmNvbT4NCj4gDQo+IFRoYW5rcyBhbmQgc29ycnksIFBh
bGksIGl0J3MgaW4gZm9yLW5leHQgYWxyZWFkeSwgY2FuJ3QgcmViYXNlLg0KDQpBbmR5LA0KU2lu
Y2UgaXQncyBhbHJlYWR5IGluIGZvci1uZXh0IGl0J3MgcHJvYmFibHkgdG9vIGxhdGUgdG8gYWRk
IHRoZSBzdGFibGUgQ0MgdG9vIHJpZ2h0Pw0KDQpTbyB3aGF0J3MgdGhlIHByb3BlciB0aW1lIG5v
dyB0byBzZW5kIHRoaXMgdG8gQHN0YWJsZT8gIEFuZCBzaG91bGQgSSBqdXN0IGZvcndhcmQgZXhp
c3RpbmcNCnBhdGNoPw0KDQpUaGFua3MsDQo=
