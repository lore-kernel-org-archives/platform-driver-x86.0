Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53BE9C433ED
	for <platform-driver-x86@archiver.kernel.org>; Mon, 17 May 2021 08:31:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 382E061244
	for <platform-driver-x86@archiver.kernel.org>; Mon, 17 May 2021 08:31:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235501AbhEQIcg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 17 May 2021 04:32:36 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151]:50005 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229755AbhEQIcg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 17 May 2021 04:32:36 -0400
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-219-3UlcEW98NA-nIwfojSR38g-1; Mon, 17 May 2021 09:31:16 +0100
X-MC-Unique: 3UlcEW98NA-nIwfojSR38g-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Mon, 17 May 2021 09:31:13 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.015; Mon, 17 May 2021 09:31:13 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Nathan Chancellor' <nathan@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>
CC:     Arnd Bergmann <arnd@arndb.de>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "clang-built-linux@googlegroups.com" 
        <clang-built-linux@googlegroups.com>
Subject: RE: [PATCH] [v2] platform/surface: aggregator: avoid clang
 -Wconstant-conversion warning
Thread-Topic: [PATCH] [v2] platform/surface: aggregator: avoid clang
 -Wconstant-conversion warning
Thread-Index: AQHXSQdQtGc3TDOhPEi9QDyAZ4cunarnW2LA
Date:   Mon, 17 May 2021 08:31:12 +0000
Message-ID: <16280aaedc40425295d202431ac3adc0@AcuMS.aculab.com>
References: <20210514200453.1542978-1-arnd@kernel.org>
 <057b5568-c4b8-820c-3dd7-2200f61a4d58@kernel.org>
In-Reply-To: <057b5568-c4b8-820c-3dd7-2200f61a4d58@kernel.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

RnJvbTogTmF0aGFuIENoYW5jZWxsb3INCj4gU2VudDogMTQgTWF5IDIwMjEgMjI6MjMNCj4gPg0K
PiA+IENsYW5nIGNvbXBsYWlucyBhYm91dCB0aGUgYXNzaWdubWVudCBvZiBTU0FNX0FOWV9JSUQg
dG8NCj4gPiBzc2FtX2RldmljZV91aWQtPmluc3RhbmNlOg0KDQpIYXMgdGhpcyBiZWVuIHJhaXNl
ZCB3aXRoIGNsYW5nPw0KDQouLi4NCj4gPiAtCS50YXJnZXQgICA9ICgodGlkKSAhPSBTU0FNX0FO
WV9USUQpID8gKHRpZCkgOiAwLAkJCVwNCj4gPiAtCS5pbnN0YW5jZSA9ICgoaWlkKSAhPSBTU0FN
X0FOWV9JSUQpID8gKGlpZCkgOiAwLAkJCVwNCj4gPiAtCS5mdW5jdGlvbiA9ICgoZnVuKSAhPSBT
U0FNX0FOWV9GVU4pID8gKGZ1bikgOiAwCQkJCVwNCj4gPiArCS50YXJnZXQgICA9IF9fYnVpbHRp
bl9jaG9vc2VfZXhwcigodGlkKSAhPSBTU0FNX0FOWV9USUQsICh0aWQpLCAwKSwJXA0KPiA+ICsJ
Lmluc3RhbmNlID0gX19idWlsdGluX2Nob29zZV9leHByKChpaWQpICE9IFNTQU1fQU5ZX0lJRCwg
KGlpZCksIDApLAlcDQo+ID4gKwkuZnVuY3Rpb24gPSBfX2J1aWx0aW5fY2hvb3NlX2V4cHIoKGZ1
bikgIT0gU1NBTV9BTllfRlVOLCAoZnVuKSwgMCkNCg0KQSBzaW1wbGVyIGFsdGVybmF0aXZlOg0K
CQk9IGZ1biAqIChmdW4gIT0gU1NBTV9BTllfRlVOKQ0KDQoJRGF2aWQNCg0KLQ0KUmVnaXN0ZXJl
ZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXlu
ZXMsIE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQ0K

