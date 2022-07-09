Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8086BC433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat,  9 Jul 2022 01:34:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229560AbiGIBeB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 8 Jul 2022 21:34:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiGIBeB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 8 Jul 2022 21:34:01 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3CE7EE03
        for <platform-driver-x86@vger.kernel.org>; Fri,  8 Jul 2022 18:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1657330425;
        bh=CcycPIXmFtN1Is0M2Jny1b4InhkRB8XtD1SbY8wn/Vs=;
        h=X-UI-Sender-Class:To:Cc:From:Subject:Date;
        b=bxyRPkviEh+iFbYtQv3nmE5V9zxN8uSI7Zf03hHPUm1s0+laMvpt6SeB4pvY8s1rC
         c6fXDSKf3A/jRK7YVVcNK0D0EZM87jlKQniU/6pbCInH9HvUGPMmqR2dFFghfFMyYX
         mazbh6MkIgPLxmnn4UIDYQaAC0mytyO0Ua4Wngt8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.2.35] ([91.137.126.34]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MKbgE-1nrDTo43gq-00L0Tp; Sat, 09
 Jul 2022 03:33:45 +0200
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org
From:   Armin Wolf <W_Armin@gmx.de>
Subject: WMI driver duplicate UUID
Message-ID: <ddd7bf26-f790-1e7a-dd19-9db2e5336cff@gmx.de>
Date:   Sat, 9 Jul 2022 03:33:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Provags-ID: V03:K1:hm1QAGK8d6PWsIvLAcjoniFdreezBHxXwTv8e6hGIPPtciaQOHA
 5VGeZSMdehUGXY6T/RNiiGFJw6TXz7ZwZKDqtq1Q8xKDrapMUd4dMHvEXlnzfOnbmSwi8sA
 y5LwmdYGrc127uuwZ1fBh8Gbwh0GHBIZz2yNSIJ6fGPqEwcM1wArQovd6xc8+bTriFBcpr9
 GU/v+rWucCt8pWqqCVK0g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EXao1zwm4uQ=:2XcIVudgImp2JxdRNNoCyz
 sH1M4HwJ/B7La81wD/JpYJCmomly1wOW5KH2y9acKRqma40hMIkGLGZnZhQo0JFOtHjPInZot
 52cXwOtpNYVc1+mdQ5gowOXYWWsvQ3HXi+cNj9U/TLlXw6tZuy6QWk73Y3uf76CDUHAuauoCo
 splebaR2CXFNTVEFCgxJXV3e1X56BnakOQCcwDuVO43S/66E/5APAhoOQENyMxqVQKp29CCJV
 c+m2stMtLOtnHuRF8OD1t87YZsTt03e7+O1BrvoKd/L5WRy+E2lRBYHOHa+7IyhcqG/NrYFzv
 MlnYeuTzdLtgqRuSU7X4WGzjYoucvH+8ab6iDrMMDTKyUnAAbFxLU0krz2by6Z73o7Iklfywp
 mPLfGWCS5hjotnlR1Wr+2z9HPwQfvhPVDuPi/3XbYI8UapUtgJw9o7e4IgoYTQY2JMrAlmBaM
 LtGeGO+/P0mEmXR3hakTVS151jApJ1K9t42YnPy0Fz2Q5uq6bwfyzw8R0xKyq79DGu1GUTSYy
 +xoD5iLSL1iSXgG/PUAzWjgoBcb6jDrupM7eGySx7w6+T/GiTqbqAAcNdDAsg8bnhstwX+xCD
 HCJxUqDsSg0W4bcvQd7jSgxlgE6rgsBVdwey4k6G3VMbz6hejvTj20i5AT8gSFayQcYbdC0Sx
 2f6lGMmHxG/UEx0DeTyeqq+wOP2cQZA//6XtEEyFm5SAPLWdofFUgqzPC4VI9mq8NUxcyWR5u
 0a9ADB2fI3sR9B+hS8KyKMNrJJGGY1Qp/pvR62JFiNc/OfIxZ6l9+1kTlCNv/6/bw+IC8X69L
 7mOVd2VB9w8vQKwlQ3OhNbO6U9orHQeBM0TGYDr0wIGGnFepFNX+KN1J8/wO4D41Zx6VpyxBP
 HIxaaUaR54RCoY6a1yMp7rB/wYoHQ/ytCOA0vZYaZj7lV/T7ctOPxS21JSim8zBQB5ypzJ5Sn
 ctfjTLIOfaX9Pa8Ct1NUtMdBlbagENO2ZIedIGMPM0wtoiqA2BbgjADzoJm+Twg23UOzIJ5F8
 C8lhTSzqnf8TDR5i5esyE0W7G/ad6yBgIY5aDZVHcIOMNE2mhPqBlc+m8lmsNxAdKtOn8vMXC
 BricTxU7mq35hPHe1iHuZijSpILRy4iYvq2gOhUx4DkUvDc2/oXtngTog==
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hello,

while trying to write my own WMI driver, i noticed that the WMI bus driver complained
about duplicated WMI UUIDs. After doing some research, i think i found the reason for
these messages:

Apparently, the ACPI WMI specification by Microsoft treats the _UID of the WMI PnP-device
like a namespace, which means that duplicate UUIDs are llegal if they do not share the same
namespace (= PnP-device).

In my case, only one wmi-bmof device is used, the rest is filtered out despite laying in
a different namespace since they have the same UUID.

Could it be theoretically possible to fix this issue with the WMI bus?

Armin Wolf

