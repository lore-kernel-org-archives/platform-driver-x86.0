Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B98E7E748E9
	for <platform-driver-x86@archiver.kernel.org>; Sun,  1 Oct 2023 16:09:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235183AbjJAQJY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 1 Oct 2023 12:09:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235155AbjJAQJX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 1 Oct 2023 12:09:23 -0400
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 846EFDA
        for <platform-driver-x86@vger.kernel.org>; Sun,  1 Oct 2023 09:09:21 -0700 (PDT)
Received: from eig-obgw-5006a.ext.cloudfilter.net ([10.0.29.179])
        by cmsmtp with ESMTP
        id mwJvqMJp5NWIemz0Sqv7Sh; Sun, 01 Oct 2023 16:09:20 +0000
Received: from shared083.arvixe.com ([143.95.229.40])
        by cmsmtp with ESMTPS
        id mz0SqFRf6TB25mz0SqaaPc; Sun, 01 Oct 2023 16:09:20 +0000
X-Authority-Analysis: v=2.4 cv=Wbkf1mtX c=1 sm=1 tr=0 ts=651999b0
 a=GmS1SBToaRoMP0YkDtvSoA==:117 a=GmS1SBToaRoMP0YkDtvSoA==:17
 a=IkcTkHD0fZMA:10 a=bhdUkHdE2iEA:10 a=--C6PtRGR58A:10
 a=6olLXnvbMdqt_GmFzjwA:9 a=QEXdDO2ut3YA:10
Received: from [41.66.218.188] (port=43520 helo=[192.168.1.28])
        by shared083.arvixe.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <me@donjajo.com>)
        id 1qmz0R-003hsE-75; Sun, 01 Oct 2023 11:09:19 -0500
Message-ID: <58ba87f3-32eb-4916-8e94-383c327812c6@donjajo.com>
Date:   Sun, 1 Oct 2023 15:09:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PROBLEM: asus_nb_wmi sends KEY_BRIGHTNESSDOWN on pressing CAPS
 Lock and PrntScrn on Zenbook S 13 UX5304VA
From:   James John <me@donjajo.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Corentin Chary <corentin.chary@gmail.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org,
        acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org
References: <a2c441fe-457e-44cf-a146-0ecd86b037cf@donjajo.com>
 <132feb67-c147-7ee6-b337-385e11786ec6@redhat.com>
 <146cb960-406b-4456-94ce-ad6ed3f330ad@donjajo.com>
 <d70f7d35-6458-437d-f68f-47291ce74a1e@redhat.com>
 <90a7309e-4a76-4dff-8259-9975dd3ed8b1@donjajo.com>
 <c98cbd94-9f2e-4af4-ad86-91a95471fc57@donjajo.com>
Content-Language: en-US
In-Reply-To: <c98cbd94-9f2e-4af4-ad86-91a95471fc57@donjajo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - shared083.arvixe.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - donjajo.com
X-BWhitelist: no
X-Source-IP: 41.66.218.188
X-Source-L: No
X-Exim-ID: 1qmz0R-003hsE-75
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.28]) [41.66.218.188]:43520
X-Source-Auth: me@donjajo.com
X-Email-Count: 3
X-Org:  HG=asoshared_arvixe;ORG=aso;
X-Source-Cap: b3h5aG9scmU7b3h5aG9scmU7c2hhcmVkMDgzLmFydml4ZS5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfOhBmOrqD744pbxoNr2Ba/GhMYdD5PklLhPk7Fu/zT4C/uuZUDxFrI93ODcyM3zrwYqympwx9ZGvhPHFs/7jI0hzxiRN5U+eLkdJeKuxuhtUExu4dRit
 0ENiDFWKkc2zURjs/UxjmZ+o+z6cyVm9Sc/qmzcJcjt8KwRS9Jf5733zDi7H+wLZI9ah6jGOKbjzm7CY+vhln6JnLUtNJGsxdxQ=
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

 > hot keys are still working except that the LED notification light on 
Mute Hotkey (F9) is no longer turning up on mute.

Kindly ignore above. It is back working after a reboot.

On 01/10/2023 14:18, James John wrote:
> hot keys are still working except that the LED notification light on 
> Mute Hotkey (F9) is no longer turning up on mute. 
