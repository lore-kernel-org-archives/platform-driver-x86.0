Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28522C433DB
	for <platform-driver-x86@archiver.kernel.org>; Fri,  5 Mar 2021 10:55:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CEBAC64FEE
	for <platform-driver-x86@archiver.kernel.org>; Fri,  5 Mar 2021 10:55:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbhCEKyh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 5 Mar 2021 05:54:37 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:43993 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229679AbhCEKyR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 5 Mar 2021 05:54:17 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id C0C761EF2;
        Fri,  5 Mar 2021 05:54:16 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 05 Mar 2021 05:54:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=64R0QP
        uF4DXuzRPeiwgUeIPQTz/5VMxqBBj+uaZ55cU=; b=tnxkfzD/BIU/bUbEgQTrVL
        1mltVU9kuyPjHAPPKjVJER6mbaTEFCss9fmrR8yBRf0J5jS4usWB1H/K3DenN/7V
        MC3RA7iTrjrPd2Vl5URysd2z/LmLl3ntaIMr9QwJhLSHTb35vYIp1/gjiZYPYGGu
        OkOTvezl3Q7+7ZWFERhyksNeASZ1e4NHF0en6/XkIPSYObSyNM4LpaX+n1K4H+KR
        3Wmc1mN28Kgu8+gb717sRd417BZTZKqO1gvVXJZcf60TEL287c/f+qI1HZoXOLgw
        uH9ZyVfMrFBVheL7aAiBinF+sTpRUq9eq8U3zeKcu6pyxzSqLQ9yMruWkIZRZobg
        ==
X-ME-Sender: <xms:2A1CYMOeVDd13e5hNd9Dd-Gr9On58I-XO_KywvVNwBVNVoO49d7Opg>
    <xme:2A1CYC_nZFOb8y4SfGM0EuGpqkdLZQXiHYeYpgbkaSfH78J-MIrkTvAFyVhujH_VN
    NiAwrb7UGt7iave9o4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtiedgvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhuffvkfgjfhfogggtsehttdertdertddvnecuhfhrohhmpefnuhhkvgcu
    lfhonhgvshcuoehluhhkvgeslhhjohhnvghsrdguvghvqeenucggtffrrghtthgvrhhnpe
    dvgfelheeugfefteeiveefkeevleekveetfeevueeljedutefgheefgfeljeevvdenucff
    ohhmrghinhepghhithhlrggsrdgtohhmnecukfhppeduudeirddvhedurdduleefrddule
    einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheplhhu
    khgvsehljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:2A1CYDQBXwLWQeSUX_HYwb6zkXvmINAoLzqzXMOngA2cVWSb56tp5g>
    <xmx:2A1CYEunW9bJDJ_f65qEGq-0TdIS2ERp7cVOLX-OkJGFAhBnt_OFjg>
    <xmx:2A1CYEdhuxza8XOP1EEk9bQRUS27G_ZxhleD8BnQC1KR0I4L9LAFcg>
    <xmx:2A1CYOr-AkzXBhLox2sYJrrbAnveTx7gnyrveCNggJ067xB7kL6gFg>
Received: from [192.168.20.32] (unknown [116.251.193.196])
        by mail.messagingengine.com (Postfix) with ESMTPA id 2732C240054;
        Fri,  5 Mar 2021 05:54:13 -0500 (EST)
Date:   Fri, 05 Mar 2021 23:53:57 +1300
From:   Luke Jones <luke@ljones.dev>
Subject: Re: [PATCH] WMI: asus: Reduce G14 and G15 match to min product name
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     platform-driver-x86@vger.kernel.org
Message-Id: <XXSHPQ.3IV4A1VDG7UR1@ljones.dev>
In-Reply-To: <6bb6843e-f166-a1cc-f1ac-419a46c71622@redhat.com>
References: <20210227102010.65429-1-luke@ljones.dev>
        <94e01965-1511-c687-1c20-fe1f01041ac3@redhat.com>
        <GNOHPQ.KYXM8SR2TF8L@ljones.dev>
        <6bb6843e-f166-a1cc-f1ac-419a46c71622@redhat.com>
X-Mailer: geary/3.38.2
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

First report:

G14 / 2020 - integrated graphics only (NVIDIA disabled)

# cat /proc/cmdline
BOOT_IMAGE=(hd0,gpt2)/vmlinuz-5.10.19-200.fc33.x86_64 
root=UUID=c3fe67fb-a740-440b-bc2d-e7cfc9f19a42 ro rootflags=subvol=@ 
rd.luks.uuid=luks-cf5c7a8a-d5da-45ae-b556-db9c78b359e5 rhgb quiet 
rd.driver.blacklist=nouveau modprobe.blacklist=nouveau 
nvidia-drm.modeset=1 acpi_backlight=video

1. # ls /sys/class/backlight
acpi_video0 amdgpu_bl0

2. acpi_video0 max_brightness 49, brightness is changing
amdgpu_bl0 max_brightness 255, brightness is changing
Both equal bright at max value

# cat /proc/cmdline
BOOT_IMAGE=(hd0,gpt2)/vmlinuz-5.10.19-200.fc33.x86_64 
root=UUID=c3fe67fb-a740-440b-bc2d-e7cfc9f19a42 ro rootflags=subvol=@ 
rd.luks.uuid=luks-cf5c7a8a-d5da-45ae-b556-db9c78b359e5 rhgb quiet 
rd.driver.blacklist=nouveau modprobe.blacklist=nouveau 
nvidia-drm.modeset=1 acpi_backlight=native

3. # ls /sys/class/backlight
amdgpu_bl0

4. amdgpu_bl0 max_brightness 255, brightness is changing

# cat /proc/cmdline
BOOT_IMAGE=(hd0,gpt2)/vmlinuz-5.10.19-200.fc33.x86_64 
root=UUID=c3fe67fb-a740-440b-bc2d-e7cfc9f19a42 ro rootflags=subvol=@ 
rd.luks.uuid=luks-cf5c7a8a-d5da-45ae-b556-db9c78b359e5 rhgb quiet 
rd.driver.blacklist=nouveau modprobe.blacklist=nouveau 
nvidia-drm.modeset=1 acpi_backlight=vendor

5. # ls /sys/class/backlight
amdgpu_bl0

6. amdgpu_bl0 max_brightness 255, brightness is changing

5.10 kernel includes the quirk patches. Were you wanting data
with that patch removed completely? (not just the submitted one)

 From what you've said, I think I expected acpi_backlight=video to
work regardless of the patch being applied.

Regards,
Luke.

On Fri, Mar 5, 2021 at 10:36, Hans de Goede <hdegoede@redhat.com> wrote:
> <note adding the pdx86 list back to the Cc>
> 
> Hi Luke,
> 
> On 3/5/21 10:21 AM, Luke Jones wrote:
>>  Hello Hans,
>> 
>>  Many thanks for taking the time to review this and provide some
>>  knowledge.
>> 
>>  Most of what has come about in this patch is through direct user
>>  with a fairly large community I maintain on Discord centered
>>  around a utility I wrote to make ROG laptop users lives a bit
>>  better - https://gitlab.com/asus-linux. The community has been
>>  beneficial to getting some realtime testing done, shortening
>>  time.
>> 
>>  In the case of the 2021 Ryzen laptops I'm pleased you asked
>>  questions. I asked the single G15 laptop owner we have to
>>  check functionality and yes, we don't need that code.
>>  It appears there were some crossed wires in conversations.
>> 
>>  I will amend the patch keeping the glob style got 2020 G14
>>  and G15 as we do have concrete anecdotal evidence that all
>>  *those* models, and some un-added ones need the quirk.
> 
> If possible I would like to see some more research done on
> those 2020 models too.
> 
> Specifically it would be good to get the following info:
> 
> 1. Output of "ls /sys/class/backlight" with "acpi_backlight=video"
> on the kernel commandline.
> 
> 2. Testing of *all* the present backlight devices with 
> "acpi_backlight=video"
> on the kernel commandline. The user can test this by doing:
> 
> cd /sys/class/backlight/$backlight-name
> cat max_brightness
> echo $value-between-0-and-max_brightness > brightness
> echo $another-value-between-0-and-max_brightness > brightness
> etc.
> 
> And then see if the brightness of the screen actually changes.
> 
> 3. Output of "ls /sys/class/backlight" with "acpi_backlight=native"
> on the kernel commandline.
> 
> 4. Testing of *all* the present backlight devices with 
> "acpi_backlight=native"
> on the kernel commandline (see 2.)
> 
> 5. Output of "ls /sys/class/backlight" with "acpi_backlight=vendor"
> on the kernel commandline.
> 
> 6. Testing of *all* the present backlight devices with 
> "acpi_backlight=vendor"
> on the kernel commandline (see 2.)
> 
> 
> My hope/expectation is that acpi_backlight=video will also work,
> because as said using acpi_backlight=vendor is somewhat weird for
> 2020 / 2021 laptop models.  Also typically the acpi-video backlight
> interface will have a larger max_brightness giving finer grained
> (more steps) brightness control.
> 
> Regards,
> 
> Hans
> 
> 
> 
>>  On Thu, Mar 4, 2021 at 15:35, Hans de Goede <hdegoede@redhat.com> 
>> wrote:
>>>  Hi,
>>> 
>>>  On 2/27/21 11:20 AM, Luke D Jones wrote:
>>>>   This patch reduces the product match for GA401 series laptops to
>>>>   the minimum string required.
>>>> 
>>>>   The GA401 series of laptops has a lengthy list of product
>>>>   variations in the 2020 series and the 2021 series refresh
>>>>   is using the same base product ID of GA401.
>>>> 
>>>>   The same is also true for the GA502 series, and the new GA503
>>>>   series which is added in this patch as a variant of the G15.
>>> 
>>>  Thank you for your patch.
>>> 
>>>  I msut say that I find it very strange that 2021 series laptops 
>>> need
>>>  to use the Asus vendor specific WMI interface for backlight 
>>> control.
>>> 
>>>  I see that the GA401 GA502 and GA503 models are all models with
>>>  AMD 4000/5000 series CPUs + Nvidia 2060 series GPUs.
>>>  So I guess it may be possible that this is the right thing
>>>  to do, and I do realize that we are already doing this for the
>>>  listed models. But it seems weird.
>>> 
>>>  Modern laptops almost always use the native backlight control
>>>  build into the drm/kms driver. And in some special cases
>>>  (hybrid GPU setups) they might use the good old ACPI-video
>>>  interface. But using vendor specific interfaces sounds very
>>>  wrong to me. That is something which was typically done on
>>>  pre Windows XP era hardware.
>>> 
>>>  Have you tried passing acpi_backlight=video on the kernel 
>>> commandline?
>>> 
>>>  What is the output of ls /sys/class/backlight before and after this
>>>  patch?
>>> 
>>>  What is the output of ls /sys/class/backlight when using
>>>  acpi_backlight=video on the kernel commandline?
>>> 
>>>  If the ls output shows multiple interfaces have you tried using all
>>>  listed interfaces directly from sysfs / the commandline ?
>>> 
>>>  (perhaps userspace is picking the wrong interface in the case there
>>>  are multiple interfaces?)
>>> 
>>>  Note what you are doing now is the equivalent of passing
>>>  acpi_backlight=vendor, which again is a weird thing to do on
>>>  recent / new hardware.
>>> 
>>>  Also your commit message seems to lack a lot of details like:
>>> 
>>>  1. Do you own an effected or multiple affected models yourself on
>>>  which you tested this?
>>> 
>>>  2. Was this tested by others on other models of these series?
>>> 
>>>  3. I assume this was discussed with others in some mailinglist /
>>>  forum discussion please provide links to this discussion.
>>> 
>>>  4. Has this been tested with with both the nouveau and the
>>>  nvidia binary driver or only with the nvidia binary driver ?
>>> 
>>>  5. What were the symptoms / problems noticed before making this 
>>> change
>>>  and how do things work after making the change?
>>> 
>>>  Regards,
>>> 
>>>  Hans
>>> 
>>> 
>>> 
>>> 
>>> 
>>>> 
>>>>   Signed-off-by: Luke D Jones <luke@ljones.dev>
>>>>   ---
>>>>    drivers/platform/x86/asus-nb-wmi.c | 57 
>>>> ++++--------------------------
>>>>    1 file changed, 6 insertions(+), 51 deletions(-)
>>>> 
>>>>   diff --git a/drivers/platform/x86/asus-nb-wmi.c 
>>>> b/drivers/platform/x86/asus-nb-wmi.c
>>>>   index d41d7ad14be0..f4db67c3eba2 100644
>>>>   --- a/drivers/platform/x86/asus-nb-wmi.c
>>>>   +++ b/drivers/platform/x86/asus-nb-wmi.c
>>>>   @@ -427,73 +427,28 @@ static const struct dmi_system_id 
>>>> asus_quirks[] = {
>>>>        },
>>>>        {
>>>>            .callback = dmi_matched,
>>>>   -        .ident = "ASUSTeK COMPUTER INC. GA401IH",
>>>>   +        .ident = "ASUSTeK COMPUTER INC. GA401",
>>>>            .matches = {
>>>>                DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>>>>   -            DMI_MATCH(DMI_PRODUCT_NAME, "GA401IH"),
>>>>   +            DMI_MATCH(DMI_PRODUCT_NAME, "GA401"),
>>>>            },
>>>>            .driver_data = &quirk_asus_vendor_backlight,
>>>>        },
>>>>        {
>>>>            .callback = dmi_matched,
>>>>   -        .ident = "ASUSTeK COMPUTER INC. GA401II",
>>>>   +        .ident = "ASUSTeK COMPUTER INC. GA502",
>>>>            .matches = {
>>>>                DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>>>>   -            DMI_MATCH(DMI_PRODUCT_NAME, "GA401II"),
>>>>   +            DMI_MATCH(DMI_PRODUCT_NAME, "GA502"),
>>>>            },
>>>>            .driver_data = &quirk_asus_vendor_backlight,
>>>>        },
>>>>        {
>>>>            .callback = dmi_matched,
>>>>   -        .ident = "ASUSTeK COMPUTER INC. GA401IU",
>>>>   +        .ident = "ASUSTeK COMPUTER INC. GA503",
>>>>            .matches = {
>>>>                DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>>>>   -            DMI_MATCH(DMI_PRODUCT_NAME, "GA401IU"),
>>>>   -        },
>>>>   -        .driver_data = &quirk_asus_vendor_backlight,
>>>>   -    },
>>>>   -    {
>>>>   -        .callback = dmi_matched,
>>>>   -        .ident = "ASUSTeK COMPUTER INC. GA401IV",
>>>>   -        .matches = {
>>>>   -            DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>>>>   -            DMI_MATCH(DMI_PRODUCT_NAME, "GA401IV"),
>>>>   -        },
>>>>   -        .driver_data = &quirk_asus_vendor_backlight,
>>>>   -    },
>>>>   -    {
>>>>   -        .callback = dmi_matched,
>>>>   -        .ident = "ASUSTeK COMPUTER INC. GA401IVC",
>>>>   -        .matches = {
>>>>   -            DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>>>>   -            DMI_MATCH(DMI_PRODUCT_NAME, "GA401IVC"),
>>>>   -        },
>>>>   -        .driver_data = &quirk_asus_vendor_backlight,
>>>>   -    },
>>>>   -        {
>>>>   -        .callback = dmi_matched,
>>>>   -        .ident = "ASUSTeK COMPUTER INC. GA502II",
>>>>   -        .matches = {
>>>>   -            DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>>>>   -            DMI_MATCH(DMI_PRODUCT_NAME, "GA502II"),
>>>>   -        },
>>>>   -        .driver_data = &quirk_asus_vendor_backlight,
>>>>   -    },
>>>>   -    {
>>>>   -        .callback = dmi_matched,
>>>>   -        .ident = "ASUSTeK COMPUTER INC. GA502IU",
>>>>   -        .matches = {
>>>>   -            DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>>>>   -            DMI_MATCH(DMI_PRODUCT_NAME, "GA502IU"),
>>>>   -        },
>>>>   -        .driver_data = &quirk_asus_vendor_backlight,
>>>>   -    },
>>>>   -    {
>>>>   -        .callback = dmi_matched,
>>>>   -        .ident = "ASUSTeK COMPUTER INC. GA502IV",
>>>>   -        .matches = {
>>>>   -            DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>>>>   -            DMI_MATCH(DMI_PRODUCT_NAME, "GA502IV"),
>>>>   +            DMI_MATCH(DMI_PRODUCT_NAME, "GA503"),
>>>>            },
>>>>            .driver_data = &quirk_asus_vendor_backlight,
>>>>        },
>>>> 
>>> 
>> 
>> 
> 


