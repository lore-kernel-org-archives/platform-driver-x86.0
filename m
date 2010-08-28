From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH] intel_ips: quieten "power or thermal limit exceeded"
 messages
Date: Sat, 28 Aug 2010 12:23:35 -0300
Message-ID: <20100828152335.GA2212@khazad-dum.debian.net>
References: <1282869660.1836.5.camel@Joe-Laptop>
 <4C77171E.6060008@cesarb.net>
 <1282894751.1836.41.camel@Joe-Laptop>
 <4C784650.2030200@cesarb.net>
 <1282962104.1946.179.camel@Joe-Laptop>
 <4C78E8EF.1000009@cesarb.net>
 <1282994116.1946.226.camel@Joe-Laptop>
 <4C790693.1060908@cesarb.net>
 <1283002154.1946.268.camel@Joe-Laptop>
 <4C791ABA.9070005@cesarb.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out1.smtp.messagingengine.com ([66.111.4.25]:37973 "EHLO
	out1.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751925Ab0H1PXj (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 28 Aug 2010 11:23:39 -0400
Content-Disposition: inline
In-Reply-To: <4C791ABA.9070005@cesarb.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Cesar Eduardo Barros <cesarb@cesarb.net>
Cc: Joe Perches <joe@perches.com>, Jesse Barnes <jbarnes@virtuousgeek.org>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 28 Aug 2010, Cesar Eduardo Barros wrote:
> The solution here probably is not less logging. The best solution
> IMO would be to do some sanity checking when loading the module, and
> if the values do not make sense, print something to the log and
> return -ENODEV.

As long as your sanity checking won't make the module fail to load in t=
he
following scenario:

1. environment temperature control fails, room starts to heat up
2. things go south, server reboots due to exceeded temperature limits
3. OS boots in an overheat situation
4. module refuse to load because it expects to never start in a overhea=
ting
   situation.

If the sanity checks will cause (4), then don't add them.  rate-limit t=
he
thermal alarms (issue them only once every T, and only if temperature h=
as
increased more than, say, 5=B0C from the last alarm).

If a given platform is buggy crap (or just el-cheapo trash that overhea=
ts
all the time) to the point that the module is useless, blacklist it by =
DMI
and inform the user.

> I expect that, when it works as it should, the first read while
> loading the module already returns sane values, so a sanity check

well, as long as "sane" does include server-is-too-hot situations...

> there should not have many false positives. OTOH, it is best to not
> load the module when you think things are strange.

What good is an alarm module that refuses to load when there is an alar=
m
condition happening already?

--=20
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
