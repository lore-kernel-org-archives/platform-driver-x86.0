Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E15C4338F
	for <platform-driver-x86@archiver.kernel.org>; Fri, 20 Aug 2021 10:09:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C1EF610F9
	for <platform-driver-x86@archiver.kernel.org>; Fri, 20 Aug 2021 10:09:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238646AbhHTKJ6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 20 Aug 2021 06:09:58 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:43647 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238952AbhHTKJl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 20 Aug 2021 06:09:41 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 03A073200A8E;
        Fri, 20 Aug 2021 06:09:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Fri, 20 Aug 2021 06:09:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=+jI2Ki
        vN3nqzk1Z7b+Hk+vmvgoVRpCyCiXkdlhOpzCk=; b=OJ1ppCU4Dmv6XRrjrjdtQ0
        yJalWXJaOAVoh5fzp+D5lZ7pX6w/o0SDX0FIsy5Cy8FMDtAkeH0BTsOErffPuKJl
        1tufQZvvI8wL/yXzRW7woIBeGXQhSZEjhcz38OYMT2mtKqjEEXj8KT1I7ULXEWza
        hkid4yaaucxLdpXls3DeQ29MyMKtRdSzi6pCoxtSAJ31dkLGMwEvmbLXnvjprnZF
        zKfeATQoEYb66tVxhlgKTktmn+oGNGxkQtD87s0QPyUenv/majQwj6GMxvEuUqHH
        UzDu/B4Rxkzeft818mqfOxU9tZcQUPzwCzW0pP3n8SrjHM8i1SVcSiR3WRFacsCA
        ==
X-ME-Sender: <xms:PX8fYb-dyT29D9o2OSU186rS_tBo_y4vUzzhZdKmGAbGD5iyZwu_VQ>
    <xme:PX8fYXvgm8hDU9fGq-w8-dNEV9oZOGJbko9ij1qORjiQbJ5MPTJtDwqWNc23-UjBG
    luYla63vvW6aIYP014>
X-ME-Received: <xmr:PX8fYZBu0QgTincV9XlS25FSdVXJWSv6jkCr5N4V_rdvujmr2F1OwQ9kgMTMjla8PyZ1vw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleelgddvfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffuvffkjghfofggtgesthdtredtredtvdenucfhrhhomhepnfhukhgvucfl
    ohhnvghsuceolhhukhgvsehljhhonhgvshdruggvvheqnecuggftrfgrthhtvghrnhepgf
    effedufffhgfeuheegffffgeegveeifeeutefhieejffetudfgueevteehtdetnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheplhhukhgvsehljh
    honhgvshdruggvvh
X-ME-Proxy: <xmx:PX8fYXffJPwahhNcaV9gQIsUxMuogKZWR1oE0co7g_TCoT9J6N5vbA>
    <xmx:PX8fYQPUb-x5XQha2c-2dx3L-Z_uOJcMeHCq09Cm9C9O-PrNm9GLWA>
    <xmx:PX8fYZmTwrFCAxb-Sm-PhCp1Nbux-uTddYwHvAuZm4vf09iSpC0FLw>
    <xmx:Pn8fYa3CFbiW7DY-qRoBQNLshbiZvv3j5Ke5mEveiaq-zR-fi9CpHw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Aug 2021 06:08:57 -0400 (EDT)
Date:   Fri, 20 Aug 2021 22:08:40 +1200
From:   Luke Jones <luke@ljones.dev>
Subject: Re: [PATCH v4 0/1] asus-wmi: Add support for custom fan curves
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     linux-kernel@vger.kernel.org, hadess@hadess.net,
        platform-driver-x86@vger.kernel.org
Message-Id: <HUU4YQ.B56UY5B3K9V6@ljones.dev>
In-Reply-To: <b94a452c-696f-d879-d239-701223c8caff@redhat.com>
References: <20210820095726.14131-1-luke@ljones.dev>
        <b94a452c-696f-d879-d239-701223c8caff@redhat.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans,

Yes sorry about that. It is now stabilised and ready for review. I 
don't expect any more changes unless some of the folks testing it find 
issues - and then I'll hold off on new versions until first review is 
completed.

Cheers,
Luke.

On Fri, Aug 20 2021 at 12:05:15 +0200, Hans de Goede 
<hdegoede@redhat.com> wrote:
> Hi Luke,
> On 8/20/21 11:57 AM, Luke D. Jones wrote:
>>  Add support for custom fan curves found on some ASUS ROG laptops.
>> 
>>  The patch has gone through a few revisions as others tested it and
>>  requested bahaviour changes or reported issues. V4 should be 
>> considered
>>  finalised for now and I won't submit a new version until V4 has been
>>  reviewed.
>> 
>>  - V1
>>    + Initial patch work
>>  - V2
>>    + Don't fail and remove wmi driver if error from
>>      asus_wmi_evaluate_method_buf() if error is -ENODEV
>>  - V3
>>    + Store the "default" fan curves
>>    + Call throttle_thermal_policy_write() if a curve is erased to 
>> ensure
>>      that the factory default for a profile is applied again
>>  - V4
>>    + Do not apply default curves by default. Testers have found that 
>> the
>>      default curves don't quite match actual no-curve behaviours
>>    + Add method to enable/disable curves for each profile
> 
> You are sending new revisions pretty fast. I don't really have an 
> issue
> with that, but can you let me know when you think this has stabilized
> a bit ?  Then I can review it when it is not changing so much anymore 
> :)
> 
> Regards,
> 
> Hans
> 


