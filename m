From: Allen <allen.lkml@gmail.com>
Subject: Re: [PATCH v2] drivers:platform/x86:Use ARRAY_SIZE() for the size
 calculation of the array.
Date: Wed, 13 Sep 2017 16:22:12 +0530
Message-ID: <CAOMdWSLd2qi9s1junVXHM23_fPAs3hrd0iuEtypKPminppUiXQ@mail.gmail.com>
References: <1505292855-27476-1-git-send-email-allen.lkml@gmail.com>
 <874ls6kjbw.fsf@miraculix.mork.no> <5F7315E704FA0841B5DFCE90329B2BB4661DAD1D@BGSMSX102.gar.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:36581 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751148AbdIMKwO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Sep 2017 06:52:14 -0400
In-Reply-To: <5F7315E704FA0841B5DFCE90329B2BB4661DAD1D@BGSMSX102.gar.corp.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Chakravarty, Souvik K" <souvik.k.chakravarty@intel.com>
Cc: =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

>>
>> What's the point?  Why not simply replace all instances of TELEM_EVT_LEN
>> with ARRAY_SIZE?
> I was about to say this too, although I should have probably said this in the first spin itself.
>

 I'll have it done and send out v3.

- Allen
