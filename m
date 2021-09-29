Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCCC6C433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 29 Sep 2021 10:45:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9260561409
	for <platform-driver-x86@archiver.kernel.org>; Wed, 29 Sep 2021 10:45:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244860AbhI2Krd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 29 Sep 2021 06:47:33 -0400
Received: from mout.gmx.net ([212.227.15.19]:34005 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244849AbhI2Krd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 29 Sep 2021 06:47:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1632912340;
        bh=SQV/6Xrm1BNEKZYYRZRhdkXQBDu7PdO+jV2qPhZoF1k=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=LN7ezw3j3zT+Z7I1mAyX/BFupjWuOexoUpDmmqccYXGIEOOryuZuI4JL3PTLBRFzq
         AHQ8zRA/20eS0Go1eEFp0LkY4lGh0BqlRtbgtXm32Km9zpq0tPIWaLO+v7Eq5zZ0zh
         XpqNnCWE3hxA69f4svbXQXz6G3wAwgNcFNYTAje4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.135.7.100] ([87.123.183.88]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M89Gj-1mRyJk3lcx-005JCr; Wed, 29
 Sep 2021 12:45:39 +0200
Subject: Re: [PATCH 1/3] thinkpad_acpi: add support for force_discharge
To:     Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?Q?Nicol=c3=b2_Piazzalunga?= <nicolopiazzalunga@gmail.com>,
        Mark Pearson <markpearson@lenovo.com>,
        platform-driver-x86@vger.kernel.org,
        Nitin Joshi1 <njoshi1@lenovo.com>,
        Sebastian Reichel <sre@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Benjamin Berg <bberg@redhat.com>
Cc:     jwrdegoede@fedoraproject.org, smclt30p@gmail.com
References: <c2504700-06e9-e7d8-80f7-de90b0b6dfb5@gmail.com>
 <06f65bb5-eca4-c1ba-a8c2-b44f8a94c699@redhat.com>
 <2ea2d9b7-4a15-6aea-1aff-4e1cb80a026f@lenovo.com>
 <ac508b49-7958-3afa-25cf-416d701034e3@gmail.com>
 <ba6698de-1700-fce9-6bca-12ee577ac09b@redhat.com>
 <943fa4fb-273a-0a36-4919-26c05ae4a534@gmx.net>
 <0eeb17bd-59f7-075e-f789-3814cc9a0505@redhat.com>
From:   Thomas Koch <linrunner@gmx.net>
Message-ID: <a6c448f7-d0c5-2652-46df-590085b47bd1@gmx.net>
Date:   Wed, 29 Sep 2021 12:45:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <0eeb17bd-59f7-075e-f789-3814cc9a0505@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RheI0PQsn95d0JPM85q8Ch8aW3ZC//S0Wo7w3ToRG9zQmKbtLdX
 9P9XqIRbpEefcg0KxcjHQykIKR3Snu+73rVcEkIPzuNB6+i+sM/NgUcN6xIZiSVzGydaba1
 Gr9cHKZWWCMrgw5MHQEYJKWZkHsqLLcQ/FwonoWeEXjztIF6hzILUQasaq2LjN3LDf8drfv
 Oidcte4N03K0YGFUftDsA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hioSCVTwswU=:bAn7k9jT60Tws/64uhD2eX
 yyhrrcpNxBPREtBQ9RUyiEwdwdNHMB/zQaRPrdg6PBuCISzwp9xH7qR4cZ+fpJnZiJ2LHJIEH
 7PdBtR+9XtbSm/GDIK1buuL8knLcSg7YAfI+dE4a2WPZbSZcNeiIGtwJVY6Z9wSKj2Zaa6HzE
 uz7NwWPgSe1jZ7ZLk/om2ab9vPTj7P8JCjXcXjU+yuA3VIJythqX4gQK4aTPfSwqfRA433anw
 ZqZ8WGBv32iEqeZW8y9OyA6cjYP+iaZDXrkWwPt30qPrMx8sL1UY57EqVfPR4kpoZ18fB/fp0
 gDSrYSn+hUvf8Tl+YfqzenenagMNu3nH4KXCOm+vryd0u5DCCFCVoDgmHTO/FrHIp6f9B1IKK
 eN6oILJc30/Rmr8LkGODHesgs7U/1A55yj0/ak8CwMdujS9vXq/E3j1k+xgq83rNKB7FEfyz/
 4/lVlRLn94KmJwQfHfiXmz+0/bsp98+gtiGtAYXt1cAIW7mEe+9Avc1pS/jWlmdPLMeCqBQjt
 Q6LFykWMCh8JcAcqRe0OjA0vAOLg2bY2z2GvCL8Vkqq09nd66F7UzFf8dSH9wbuZfldjjlFHo
 eYOqHn1gQ04ZTq0t1EwI/XQckJvyKoCgY/CUuFxOG5HfDRiumDdLRXN/j/9hAqrnqCD3Yk56A
 2eXgPMW7r8Bw19+bV9lHHtnGshYUnxfvLPtjTEzvEtbZX3+v+TOZElHOYnptGIG3YeCqXC+dJ
 hMBHBjxwZxJ8COtZ3RG9x3xr9HXryqaO207uwcJUtDpQDsO05VkzDi3hQ5nj8ArAmOmRcpuXz
 OSkfGJXPjUHg85VNVmy3m9EyQ2XqX95Of+XrA2FJTcGryFJ4AvV6DS5x/BIFNoUfZ58DztEdE
 5DGWOmh/rSazFNfTbt3w/pCKWZOVOkWbja2bCQAgos2ldSyUniGzYrj/C4pDYCUS6HrlVDHO3
 GPDYX9Wx2L/NeBL9hzKFapqh7pZUCdYSdVfaDDQYhrR4vHRHpUYiet+oKYPn5iUNX8/y1qrP6
 qlxTq+bdf3KP/tcJIxqSnSiH7VOEclw7fTCUSV225kBM6fCjNtGqOhuXnx/UBT6zROhRvJ4jJ
 CezO/TYAjGp+5E=
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans,


On 29.09.21 11:55, Hans de Goede wrote:

 > Hi,

 >

 > On 9/29/21 7:47 AM, Thomas Koch wrote:

 >> Hi Hans,

 >>

 >> On 27.09.21 17:12, Hans de Goede wrote:

 >>> Hi Nicol=C3=B2,

 >>>

 >>> On 9/27/21 5:00 PM, Nicol=C3=B2 Piazzalunga wrote:

 >>>> Hi,

 >>>>

 >>>> On 9/27/21 3:59 PM, Mark Pearson wrote:

 >>>>> Do let me know if there are some important use cases for these so
I can go back to the FW team and discuss supporting them properly.

 >>>>

 >>>> The important use cases are force discharge and inhibit charge.

 >>>> These at present are dealt with using tpacpi-bat, which relies on
(out of tree) acpi_call.

 >>>> See also your previous reply.

 >>>

 >>> I can see how those can be useful in certain circumstances.

 >>>

 >>> I can also understand how Lenovo does not want these to be

 >>> available by default everywhere.

 >>>

 >>> I think a good compromise would be to add a bool module option

 >>> which defaults to false to enable these.

 >>

 >>  From the user perspective, I don't agree that this is a good

 >> compromise. Users simply want to recalibrate their battery.

 >

 > But can't they already do this by just unplugging the AC and

 > then let the machine die ?Of course, but who wants that?

 > How is this different, does it somehow magically flicks on the

 > AC just before the battery deep-discharge protection kicks in

 > so no unsaved work is lost ?

But this is exactly how it works. There is no risk of data loss.



The EC resets the force_discharge flag at the end of the discharge and
the ThinkPad is seamlessly switched back to AC power. Just magical. No
power interruptions.



Maybe now you understand why Linux users want this so badly?


 > I have never used this, but that seems unlikelyYet it works.

 > Or is the advantage of this that the AC being present results in

 > no nagging low battery warnings as well as no auto-shutdown

 > near the end ?

 >

 > If the advantage of this is indeed the no nagging + auto-shutdown

 > a better fix would be to do some userspace work to allow a

 > full, undisturbed, discharge while not on AC for calibration

 > purposes. That would also work on any vendor laptop, which would

 > be a big added bonus.

 >

 > I do believe that Lenovo does want to support doing a calibration

 > cycle under Linux. This whole thread got resurfaced / revived by

 > Mark because of discussions with Lenovo about offering better

 > battery management options under Linux.>> Having to

 >> set the module option beforehand is an unnecessary hurdle imho.

 >>

 >> Of course a module option again leads to support overhead in "user

 >> space". Then tlp-stat -b would have to inform the user that

 >> force_discharge is unfortunately not available, but he should try to s=
et

 >> the module option. What would that be good for?

 >>

 >> While I respect Mark's official opinion, I would like to counter with =
my

 >> experience from 10 years of TLP development and support:

 >>

 >> The calls for force_discharge work unmodified since the 2012 ThinkPads

 >> (T420/X220) on all models that also support charge thresholds.

 >>

 >> They also work reliably, otherwise the issue tracker at tpacpi-bat and

 >> TLP would be full of user issues.

 >>

 >> inhibit_charge is probably used rather rarely, at least no TLP user ha=
s

 >> asked for it.

 >

 > Ok, so I think we should look at the end goal here, which is doing

 > a battery calibration run, which AFAIK means discharging until

 > the machine turns off (by itself rather then an emergency shutdown

 > by the OS), followed by charging to 100%/full in one go.


Fine. There you have it, the patch is the working kernel solution for
your end goal and even more.



'tlp recalibrate' already does the user space job

handling



/sys/class/power_supply/BATx/force_discharge =3D 1 (TLP 1.4)



and includes setting



/sys/class/power_supply/AC/charge_control_end_threshold =3D 100



for a full recharge.



Mark may initiate GUI support if he so desires.

 > So as mentioned before if we can disable the emergency shutdown

 > then we should be able to do this on all vendor laptops.

 >

 > But I guess the real question here is, what do the Lenovo tools

 > under Windows do?

 >

 > Mark, I assume that the Lenovo battery management tool under Windows

 > does allow doing a calibration, can you figure out how this works?

 >

 > Maybe that does actually use force_disharge and things got mixed up

 > when you asked the firmware team about all 3 features in one email,

 > and the other 2 are only for testing purposes?

 >

 >> @Mark: what is Lenovo's position on the calls for charge thresholds

 >> already included in thinkpad_acpi? Are they also internal?

 >

 > I'm not Mark, but I believe that these are officially supported,

 > as mentioned before Lenovo does want to offer better battery management

 > options under Linux.

 >

 > Regards,

 >

 > Hans

 >


Freundliche Gr=C3=BC=C3=9Fe / Kind regards,

Thomas Koch



Mail : linrunner@gmx.net

Web  : https://linrunner.de/tlp

