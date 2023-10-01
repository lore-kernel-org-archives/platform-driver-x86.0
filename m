Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B02EFE748ED
	for <platform-driver-x86@archiver.kernel.org>; Sun,  1 Oct 2023 09:46:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234717AbjJAJq3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 1 Oct 2023 05:46:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234747AbjJAJq0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 1 Oct 2023 05:46:26 -0400
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BBA1C5
        for <platform-driver-x86@vger.kernel.org>; Sun,  1 Oct 2023 02:46:22 -0700 (PDT)
Received: from eig-obgw-6005a.ext.cloudfilter.net ([10.0.30.201])
        by cmsmtp with ESMTP
        id mm6Jq7yFoqBU3mt1mqg27n; Sun, 01 Oct 2023 09:46:19 +0000
Received: from shared083.arvixe.com ([143.95.229.40])
        by cmsmtp with ESMTPS
        id mt1mqjkvprk9tmt1mqsrn2; Sun, 01 Oct 2023 09:46:18 +0000
X-Authority-Analysis: v=2.4 cv=PKccRNmC c=1 sm=1 tr=0 ts=65193fea
 a=GmS1SBToaRoMP0YkDtvSoA==:117 a=GmS1SBToaRoMP0YkDtvSoA==:17
 a=IkcTkHD0fZMA:10 a=bhdUkHdE2iEA:10 a=--C6PtRGR58A:10 a=Br9LfDWDAAAA:8
 a=YEpLdx_Yf8SzexEfGrYA:9 a=KqO4cHfzvmCxJwQr:21 a=QEXdDO2ut3YA:10
 a=TRW-o2S9CEoA:10 a=OsUonXv-ptgA:10 a=gR_RJRYUad_6_ruzA8cR:22
Received: from [41.66.218.188] (port=45690 helo=[192.168.1.14])
        by shared083.arvixe.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <me@donjajo.com>)
        id 1qmt1l-001PvC-B3; Sun, 01 Oct 2023 04:46:17 -0500
Message-ID: <146cb960-406b-4456-94ce-ad6ed3f330ad@donjajo.com>
Date:   Sun, 1 Oct 2023 08:46:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PROBLEM: asus_nb_wmi sends KEY_BRIGHTNESSDOWN on pressing CAPS
 Lock and PrntScrn on Zenbook S 13 UX5304VA
To:     Hans de Goede <hdegoede@redhat.com>,
        Corentin Chary <corentin.chary@gmail.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org,
        acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org
References: <a2c441fe-457e-44cf-a146-0ecd86b037cf@donjajo.com>
 <132feb67-c147-7ee6-b337-385e11786ec6@redhat.com>
Content-Language: en-US
From:   James John <me@donjajo.com>
In-Reply-To: <132feb67-c147-7ee6-b337-385e11786ec6@redhat.com>
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
X-Exim-ID: 1qmt1l-001PvC-B3
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.14]) [41.66.218.188]:45690
X-Source-Auth: me@donjajo.com
X-Email-Count: 10
X-Org:  HG=asoshared_arvixe;ORG=aso;
X-Source-Cap: b3h5aG9scmU7b3h5aG9scmU7c2hhcmVkMDgzLmFydml4ZS5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfI2+0D7kjjnbQw+kQuAlSz41BqHyZnZz/WcAe5WHEUcMXySFBfrPvjKKFPSmrULfJssEgFjcKe9WaCf22mc6Iy7KuB6B/4CkSZVmPcHsfEF7HTTmhQxe
 1ZMG6CiF8mDoeNMtpiR2XHtK14zFoocg20WLZ62AsW+0l9EPqICRo1h2CDSVQgDF1YxzLyl5dRYC/8umfhM9SUFam8HQjb0XwOI=
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hello Han,

Thank you very much for this detailed steps. I was able to reproduce 
this with "evtest" and everything went okay.

After editing /lib/udev/hwdb.d/60-keyboarrd.hwdb as you specified, the 
problem has been fixed, which I believe should revert on reboot?


This is the content of /sys/class/dmi/id/modalias

dmi:bvnAmericanMegatrendsInternational,LLC.:bvrUX5304VA.304:bd05/16/2023:br5.27:svnASUSTeKCOMPUTERINC.:pnZenbookS13UX5304VA_UX5304VA:pvr1.0:rvnASUSTeKCOMPUTERINC.:rnUX5304VA:rvr1.0:cvnASUSTeKCOMPUTERINC.:ct10:cvr1.0:sku:


Yes, I built my kernel. I wish I could parse this and write a proper quirk.

Also, I don't know if this is related; the hotkeys should be enabled by 
default. Fn key should be for Function keys. But in the current state, 
it is reversed.


Thank you

James

On 01/10/2023 09:28, Hans de Goede wrote:
> Hi James,
>
> On 10/1/23 10:11, James John wrote:
>> Hello,
>>
>> First of all, thank you very much for the work you do with maintaining these drivers and supporting systems. It is not an easy one.
>>
>> I have debugged this bug down to the asus_nb_wmi module. When I disable this module, the problem goes away, but then other hotkeys are not recognized. Attached is a debug event from libinput, where I pressed the capslock twice
>>
>> I have tried to dabble around with asus-nb-wmi.c codes to see if I could fix it by luck, by adding UX5304VA to `static const struct dmi_system_id asus_quirks[]` but to no avail. And I have a very little knowledge of what "quirks" are.
>>
>> I have attached some information regarding my hardware and kernel. I will be available to provide any more information that might be needed to resolve this.
>>
>> A related open thread: https://bbs.archlinux.org/viewtopic.php?pid=2123716
> First of all lets confirm that the KEY_BRIGHTNESSDOWN events are really coming from asus_nb_wmi.
>
> Please install evtest and then run "sudo evtest" and then select the "Asus WMI hotkeys" device
> by typing its number followed by enter.
>
> After this reproduce the bug and see if the log shows KEY_BRIGHTNESSDOWN.
>
> Since you said you tried playing around with the quirks, I assume you can build
> your own kernel, please let me know if that is wrong.
>
> If this confirms the KEY_BRIGHTNESSDOWN events are coming from the "Asus WMI hotkeys" device,
> then please edit /lib/udev/hwdb.d/60-keyboard.hwdb
>
> And search for "Asus WMI hotkeys", this should find this section:
>
> evdev:name:Asus WMI hotkeys:dmi:bvn*:bvr*:bd*:svnASUS*:pn*:*
> evdev:name:Eee PC WMI hotkeys:dmi:bvn*:bvr*:bd*:svnASUS*:pn*:*
> evdev:name:Asus Laptop extra buttons:dmi:bvn*:bvr*:bd*:svnASUS*:pn*:*
>   KEYBOARD_KEY_6b=f21                                    # Touchpad Toggle
>   KEYBOARD_KEY_7c=f20                                    # Remap micmute to f20
>
> Change this to:
>
> evdev:name:Asus WMI hotkeys:dmi:bvn*:bvr*:bd*:svnASUS*:pn*:*
> evdev:name:Eee PC WMI hotkeys:dmi:bvn*:bvr*:bd*:svnASUS*:pn*:*
> evdev:name:Asus Laptop extra buttons:dmi:bvn*:bvr*:bd*:svnASUS*:pn*:*
>   KEYBOARD_KEY_6b=f21                                    # Touchpad Toggle
>   KEYBOARD_KEY_7c=f20                                    # Remap micmute to f20
>   KEYBOARD_KEY_20=unknown
>
> And then run "sudo udevadm hwdb --update" followed by "sudo udevadm trigger",
> that should filter out the spurious keypresses.
>
> If that helps, please run:
>
> cat /sys/class/dmi/id/modalias
>
> So that a proper DMI based quirk to only to the filtering on your model
> can be written.
>
> Regards,
>
> Hans
>
