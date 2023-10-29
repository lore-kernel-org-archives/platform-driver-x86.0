Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4E36C4332F
	for <platform-driver-x86@archiver.kernel.org>; Sun, 29 Oct 2023 19:52:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbjJ2Twh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 29 Oct 2023 15:52:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbjJ2Twg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 29 Oct 2023 15:52:36 -0400
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E0CEBA
        for <platform-driver-x86@vger.kernel.org>; Sun, 29 Oct 2023 12:52:33 -0700 (PDT)
Received: by mail-vs1-xe2d.google.com with SMTP id ada2fe7eead31-457e9088d7aso1485831137.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 29 Oct 2023 12:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698609152; x=1699213952; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wbpqTi1FkkB/3AX4bK+SRdELnkkSvhXMMY9b/E7EG4k=;
        b=jsK3+JDXrErZhV8DCzo4ksiyRAfvnKe9DLgjKABZGaKkjLiRAy253YmvQA6F/XPS/1
         AILuImAf2c8A6kk1jD3ytIy8FfIADvJFBhCa6WPITDU8o0l2VHujF1iBlbjrCBQBGt+p
         1IYW5M0nl/i2byfK7KUncQlWxleX9oAjI0CEBr4vpNF+C1L9XCnggeYi+3t1oYy/kUI3
         Jo4IbNmgi1vhynbP1CB2TK5AFv3oKKGAoNIW0sZB+KZlDJ08jlQ8N5lXBqNEWEqC6QK5
         MdnOxiPfD8CILW36POo4CA2r9qilDgyZaYWcjoNm9b+HF+6kvzvXbi7FYutFewRGUISu
         Pedg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698609152; x=1699213952;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wbpqTi1FkkB/3AX4bK+SRdELnkkSvhXMMY9b/E7EG4k=;
        b=OOgDCi7xQClcvWNS/Khy38fz0rZ1LY0yV/XPPjOTqdxJuH15H7ugL0kPZXqdNEdm01
         8YI5XIB6AAxcw1Zyton2PSKgtjPs9NVKrA5+xS2JpIKpHjFUwi8cFbZfcUChQz3wGCqT
         cV0qu/2tFYc8vxITDclP0+4DNprPeGqDWD5BCYOLpfbfmGUUM+QUmFWXIi1KiwZwCpMH
         bUnJISHi1IrShJMPfinnxt0iLDPeKPlDxE/4FNosHrrkV4vG0gpmD3q/SYsBu8K3v0rV
         WygZz3gQkQPIH3Eb0+aKYa5CUaTqYQi+bP9XVsNnFprpu14iyjuI3jdfHAukHIx4/Jy+
         MZNA==
X-Gm-Message-State: AOJu0Yy7ehZY0tPBKPAawz8eAdwym/jtYhy5vBxEdHfGwskx3fo/TLSX
        r54selOZ6QeThr9YxBQrPFkUwHIZ6Vr0bQ==
X-Google-Smtp-Source: AGHT+IE8cibWpJQxAHWCzOR407fRTsVRSf/E38aj0lySwAXECpxJr6RX0VJkdPQcXYoJZlOFHo2NdQ==
X-Received: by 2002:a67:b70e:0:b0:450:8e58:2de4 with SMTP id h14-20020a67b70e000000b004508e582de4mr6516096vsf.7.1698609152559;
        Sun, 29 Oct 2023 12:52:32 -0700 (PDT)
Received: from ?IPV6:2607:fea8:4adc:dd40::2ca5? ([2607:fea8:4adc:dd40::2ca5])
        by smtp.gmail.com with ESMTPSA id dd9-20020ad45809000000b0066d12d1351fsm2756360qvb.143.2023.10.29.12.52.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Oct 2023 12:52:32 -0700 (PDT)
Message-ID: <c6402969-a372-44ad-a540-79d4ee60e190@gmail.com>
Date:   Sun, 29 Oct 2023 15:52:30 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug Report] intel/vbtn: Dell Inspiron 7352 has unreliable
 tablet-mode switch
To:     AceLan Kao <acelan.kao@canonical.com>
Cc:     platform-driver-x86@vger.kernel.org
References: <87271a74-c831-4eec-b7a4-1371d0e42471@gmail.com>
 <CAFv23Qm+-p7U5N8JpJmqNxHnN7bTT3fxQJ5O0ainRrqnvrmB7g@mail.gmail.com>
Content-Language: en-US
From:   Arnold Gozum <arngozum@gmail.com>
In-Reply-To: <CAFv23Qm+-p7U5N8JpJmqNxHnN7bTT3fxQJ5O0ainRrqnvrmB7g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi, sorry for the delayed reply. Your patch doesn't seem to work, I
still have the issue where the switch is in the wrong state after
suspend/resume.

And yes, it's been a while, and I believe the issues did exist during
that time however it was easy to ignore/forget since I'm on X11 where
libinput doesn't respond to tablet mode switches, so I neglected to
report the issue for a while. Also, about the BIOS, I'm a little
hesistant to update it since I don't have a battery. I have version A11
and the newest is A15, but Dell's update notes only mention security
fixes, so maybe it doesn't matter.

On 2023-10-17 22:05, AceLan Kao wrote:
> Arnold Gozum <arngozum@gmail.com> 於 2023年10月18日 週三 上午8:53寫道：
>>
>> Hi,
>>
>> In Linux 5.11, Dell Inspiron 7352 was added to the
>> dmi_switches_allow_list as it is a 2-in-1 which reports a chassis type
>> 10 (actually it was me who submitted the patch).
>>
>> However, the tablet mode switch can be unreliable. Randomly, switch
>> events stop being reported and SW_TABLET_MODE will by stuck at 1 or 0,
>> which I have tested by running evtest while flipping the device to and
>> from tablet mode. This is fixed after a reboot, or a suspend followed by
>> unloading and reloading the intel-vbtn module. It can also sometimes be
>> the case that upon resume, SW_TABLET_MODE does not reflect the actual
>> state of the device, which is fixed by physically flipping the screen
>> back and forth to update the state.
>>
>> Because of these issues, I think this model should be removed from the
>> allow list, unless more investigation should be done.
> Hi Arnold,
> 
> It's been a long time since you submitted the patch. Did those issues
> not occur during that time?
> Have you tried updating the BIOS to see if it helps?
> 
> From your description, I think calling VBDL might reset the status.
> You might want to try it below.
> 
> diff --git a/drivers/platform/x86/intel/vbtn.c
> b/drivers/platform/x86/intel/vbtn.c
> index 6fa1735ad7a49..681650f52ff22 100644
> --- a/drivers/platform/x86/intel/vbtn.c
> +++ b/drivers/platform/x86/intel/vbtn.c
> @@ -198,6 +198,8 @@ static void notify_handler(acpi_handle handle, u32
> event, void *context)
>        autorelease = val && (!ke_rel || ke_rel->type == KE_IGNORE);
> 
>        sparse_keymap_report_event(input_dev, event, val, autorelease);
> +
> +       acpi_evaluate_object(handle, "VBDL", NULL, NULL);
> }
> 
> /*
> 
>>
>> Thanks,
>> Arnold
