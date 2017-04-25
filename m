From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH] dell-laptop: Adds support for keyboard backlight timeout
 AC settings
Date: Tue, 25 Apr 2017 13:49:31 +0000
Message-ID: <c140b70b460f45afa43bdfd7dec723b3@ausx13mpc120.AMER.DELL.COM>
References: <1492976447-10339-1-git-send-email-pali.rohar@gmail.com>
 <CAHp75VfCiqeddWu9xfMud4sEWAvk+CDXTkgO5zbb++QhiTL=Bw@mail.gmail.com>
 <20170425125453.GK30553@pali>
 <CAHp75VdjZ4Ti1YPZVq8_fjUh0xuDbQ-EtZQQjaWQf2fhZs2mRw@mail.gmail.com>
 <20170425134044.GL30553@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa2.dell-outbound.iphmx.com ([68.232.149.220]:24053 "EHLO
        esa2.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1430759AbdDYNvY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 25 Apr 2017 09:51:24 -0400
In-Reply-To: <20170425134044.GL30553@pali>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: pali.rohar@gmail.com, andy.shevchenko@gmail.com
Cc: mjg59@srcf.ucam.org, dvhart@infradead.org, andy@infradead.org, arcadiy@ivanov.biz, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQYWxpIFJvaMOhciBbbWFpbHRv
OnBhbGkucm9oYXJAZ21haWwuY29tXQ0KPiBTZW50OiBUdWVzZGF5LCBBcHJpbCAyNSwgMjAxNyA4
OjQxIEFNDQo+IFRvOiBBbmR5IFNoZXZjaGVua28gPGFuZHkuc2hldmNoZW5rb0BnbWFpbC5jb20+
DQo+IENjOiBNYXR0aGV3IEdhcnJldHQgPG1qZzU5QHNyY2YudWNhbS5vcmc+OyBEYXJyZW4gSGFy
dA0KPiA8ZHZoYXJ0QGluZnJhZGVhZC5vcmc+OyBBbmR5IFNoZXZjaGVua28gPGFuZHlAaW5mcmFk
ZWFkLm9yZz47IEFyY2FkaXkgSXZhbm92DQo+IDxhcmNhZGl5QGl2YW5vdi5iaXo+OyBMaW1vbmNp
ZWxsbywgTWFyaW8gPE1hcmlvX0xpbW9uY2llbGxvQERlbGwuY29tPjsNCj4gUGxhdGZvcm0gRHJp
dmVyIDxwbGF0Zm9ybS1kcml2ZXIteDg2QHZnZXIua2VybmVsLm9yZz47IGxpbnV4LQ0KPiBrZXJu
ZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRlbGwtbGFwdG9wOiBB
ZGRzIHN1cHBvcnQgZm9yIGtleWJvYXJkIGJhY2tsaWdodCB0aW1lb3V0IEFDDQo+IHNldHRpbmdz
DQo+IA0KPiBPbiBUdWVzZGF5IDI1IEFwcmlsIDIwMTcgMTY6MzI6MzYgQW5keSBTaGV2Y2hlbmtv
IHdyb3RlOg0KPiA+IE9uIFR1ZSwgQXByIDI1LCAyMDE3IGF0IDM6NTQgUE0sIFBhbGkgUm9ow6Fy
IDxwYWxpLnJvaGFyQGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4gPiBPbiBUdWVzZGF5IDI1IEFwcmls
IDIwMTcgMTU6MzY6NTYgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOg0KPiA+ID4+IE9uIFN1biwgQXBy
IDIzLCAyMDE3IGF0IDEwOjQwIFBNLCBQYWxpIFJvaMOhciA8cGFsaS5yb2hhckBnbWFpbC5jb20+
IHdyb3RlOg0KPiA+DQo+ID4gPj4gVGhpcyBwYXRjaCBtaXNzZXMgZmV3IG90aGVycyB0aGF0IHdl
cmUgYXBwbGllZCB0byBvdXIgdGVzdGluZyAvIGZvci1uZXh0Lg0KPiA+ID4NCj4gPiA+IEFoLi4u
IHNvcnJ5IGZvciB0aGF0IDotKCBBbmQgSSB3YXMgaW4gaW1wcmVzc2lvbiB0aGF0IHRoZXJlIHdl
cmUgZml4ZXMNCj4gPiA+IGZvciB0aGF0IGNvZGUgd2hpY2ggdXNlIG11dGV4ZXMuLi4gTm93IEkg
a25vdyB3aHkgSSBoYXZlIG5vdCBzZWVuIHRoZW0hDQo+ID4gPg0KPiA+ID4+IEkgaGF2ZSBhcHBs
aWVkIGl0IHRvIHRlc3Rpbmcgd2l0aCBjb3JyZWN0ZWQgY29uZmxpY3QgKGVhc3kgdG8gZml4KSwN
Cj4gPiA+PiB0aG91Z2ggY2hlY2sgaWYgZXZlcnl0aGluZyBzdGlsbCBhcyBzdXBwb3NlZCB0byBi
ZS4NCj4gPiA+DQo+ID4gPiBDYW4geW91IHNlbmQgYSBsaW5rIHRvIHlvdXIgZml4Pw0KPiA+DQo+
ID4gU3VyZSwgaGVyZSBpdCBpczoNCj4gPiBodHRwOi8vZ2l0LmluZnJhZGVhZC5vcmcvbGludXgt
cGxhdGZvcm0tZHJpdmVycy0NCj4geDg2LmdpdC9jb21taXQvYmNmN2Q4YTMwZTI4ODhmNzhhMTk3
NzhhMTZkM2RkOGMxMGI0YjBhZA0KPiANCj4gSXQgaXMgT0suDQo+IA0KDQpQYWxpLA0KDQpDb25z
aWRlcmluZyB0aGlzIGlzIG5lZ2F0aXZlbHkgYWZmZWN0aW5nIGZvbGtzIG9uIHN0YWJsZSBrZXJu
ZWwgcmVsZWFzZXMgdG9vDQp3aGVuIHVzaW5nIHRoaXMgbmV3ZXIgSFcsIHdvdWxkIHlvdSBjb25z
aWRlciB0byBzZW5kIHRvIEBzdGFibGUgdG9vPw0KDQpUaGFua3MsDQo=
