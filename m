From: Matthew Garrett <matthew.garrett@nebula.com>
Subject: Re: [PATCH 4/8] minnowboard: Add base platform driver for the
 MinnowBoard
Date: Wed, 26 Jun 2013 05:36:29 +0000
Message-ID: <1372224988.9179.5.camel@x230>
References: <cover.1372211451.git.dvhart@linux.intel.com>
	 <a459c0b97ea41148af901fc73dbeff98778c7419.1372211451.git.dvhart@linux.intel.com>
	 <20130626040026.GA23621@quad.lixom.net>
	 <1372221808.8177.52.camel@envy.home> <1372222365.9179.4.camel@x230>
	 <1372224736.8177.63.camel@envy.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from [207.46.163.212] ([207.46.163.212]:28007 "EHLO
	na01-bl2-obe.outbound.protection.outlook.com"
	rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751652Ab3FZFil (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 26 Jun 2013 01:38:41 -0400
In-Reply-To: <1372224736.8177.63.camel@envy.home>
Content-Language: en-US
Content-ID: <2C06A9FFF7010348A32036CB5312020B@namprd05.prod.outlook.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Olof Johansson <olof@lixom.net>, "David S. Miller" <davem@davemloft.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "peter.p.waskiewicz.jr@intel.com" <peter.p.waskiewicz.jr@intel.com>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "danders@circuitco.com" <danders@circuitco.com>, "vishal.l.verma@intel.com" <vishal.l.verma@intel.com>, Grant Likely <grant.likely@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Richard Purdie <richard.purdie@linuxfoundation.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

T24gVHVlLCAyMDEzLTA2LTI1IGF0IDIyOjMyIC0wNzAwLCBEYXJyZW4gSGFydCB3cm90ZToNCg0K
PiBhcmUgYWxsIGJvYXJkLXNwZWNpZmljLiBUaGV5IG1hcCBHUElPIHRvIHRoZWlyIGZpeGVkIGZ1
bmN0aW9ucyBhbmQNCj4gcHJvdmlkZSBhbiBBUEkgZm9yIGJvYXJkLXNwZWNpZmljIHF1ZXJpZXMg
KG1pbm5vd2JvYXJkLmMpLCB0aGV5IHByb3ZpZGUNCj4gZXhhbXBsZSB1c2VzIChtaW5ub3dib2Fy
ZC1ncGlvIGFuZCBtaW5ub3dib2FyZC1rZXlzKSB3aGljaCBhaWQgaW4NCj4gZXhwZXJpbWVudGF0
aW9uIGFuZCB0aGUgZGV2ZWxvcG1lbnQgb2YgbmV3IGRyaXZlcnMuDQo+IA0KPiBXaGljaCBvZiB0
aGVzZSBtYWtlIHNlbnNlIGFzIEFDUEkgZGV2aWNlcyBpbiB5b3VyIG9waW5pb24/DQoNCkRvZXMg
dGhlIGZpcm13YXJlIGNvbnRhaW4gYSBjb3JyZXNwb25kaW5nIEFDUEkgZGV2aWNlIHdpdGggYSBz
cGVjaWZpYw0KX0hJRCB0aGF0IGRlZmluZXMgdGhlIHByb2dyYW1taW5nIG1vZGVsPyBJZiBzbywg
aXQgc2hvdWxkIGhhdmUgYW4gQUNQSQ0KZHJpdmVyLiBJZiBub3QsIGl0IHNob3VsZG4ndC4NCg0K
LS0gDQpNYXR0aGV3IEdhcnJldHQgfCBtamc1OUBzcmNmLnVjYW0ub3JnDQo=
