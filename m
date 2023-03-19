Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BFA2C7618A
	for <platform-driver-x86@archiver.kernel.org>; Sun, 19 Mar 2023 00:32:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230104AbjCSAcr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 18 Mar 2023 20:32:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbjCSAcq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 18 Mar 2023 20:32:46 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B05AB4
        for <platform-driver-x86@vger.kernel.org>; Sat, 18 Mar 2023 17:32:02 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 416D25C00FF;
        Sat, 18 Mar 2023 20:19:03 -0400 (EDT)
Received: from imap52 ([10.202.2.102])
  by compute5.internal (MEProxy); Sat, 18 Mar 2023 20:19:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
        1679185143; x=1679271543; bh=3JZ/ZXyXKxwVYyIikqA+vQXkxj1tGVZDnyH
        POUNK2ts=; b=jdVNYE9VxdguLan4XGQytJ2xIHtlmBHoh0RFYAuB/9tFxw52zNR
        O3SsjhdsKL2JJgbkIvrf89p1YJtFgXnEaiP7w2WYoJbDfGVNLTTw6nkHJNl0Wlq2
        gYKsQjC8yIMtJo8FZHmrJ2Trz+D2MGRlRM06ITZdBokqe2bwOfuhe0YA6hq/ot6i
        djMBnk9qJe1b5v942svCX46bN9BqvygeHXpC1MWEmmVj43v2gE5QF7BjtJvjZiel
        wfrqqliwDvHqq211dF2BS/mvBPWwn/rDl8+0ZwNXRwc1qRE3uueLfkWnB+YBOE2L
        rofVFF/pxCbw9LzqeVfjJ/C2n4O9pejVa8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1679185143; x=1679271543; bh=3JZ/ZXyXKxwVYyIikqA+vQXkxj1tGVZDnyH
        POUNK2ts=; b=dnlItp0SulLNXUP5hraATZevEWacm1dh7VvMC+/XZxd8RwMqFpW
        Wiy9/1Kug8m7xMdD73FSCm9xWyqNnW5/EWCMTw1Ab19BhDStO+d7CIN6p49HjC2j
        Mg1Kpy4N3rjyq/JlkwA+6PT8NX0plpr/LNmKHGA45ezdymZSofznvpKgvB1sVwTI
        0a8EZJ4GFavYa/kefdihEdWwAwd2evyOL2V3tlFNfpSaNbmPseYf7GfLqjOXmLaQ
        0IpEsQ1TE761M8Z/Tx1I5pXMnNiGUnyffNeWod3zco44C8wV5YgOKTjSu5ZbTAoZ
        Ps9aT7dkQLLteCU9Js0eGV15cbhMdAnAdmg==
X-ME-Sender: <xms:91QWZMg9W7WsEwIkzeeLkjkAqZceZHuZlWihtQVfhfB-WdY7QfHjGg>
    <xme:91QWZFAasd16fJjq8_2nIm0ZE54USnxDM2q0JOR7_Q3xtHTVbXr6GC3hnB4R9cO5G
    8PV386x-zyHn_agKKM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdefhedgvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfo
    rghrkhcurfgvrghrshhonhdfuceomhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsg
    gsrdgtrgeqnecuggftrfgrthhtvghrnhephfefgedufeetgfetlefgkefgvdejleelvefg
    hfejfffhtdeitdejfeekvdeugfeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepmhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgt
    rg
X-ME-Proxy: <xmx:91QWZEFsLBu3mpIEv6UbHxD06bAEXvkUNaCFOxmPhUPk9eeLrI3o7w>
    <xmx:91QWZNTp--kaRg-5i4bLicT3Bn9rRK_lYcOg0-nU3n_lz_RolhLhzw>
    <xmx:91QWZJzLCph7W8NZ69KgYaGvYCgSszdYIuxa0QoCPsHzI1fGlhaRlg>
    <xmx:91QWZE8wMVyHVzDV6W5nQs9wlpdvQbpgaKtkguXqzDh62OYlfNvBsg>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 0BF35C60091; Sat, 18 Mar 2023 20:19:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-221-gec32977366-fm-20230306.001-gec329773
Mime-Version: 1.0
Message-Id: <fd304fc1-910b-4181-8978-48d9e7f3d5ab@app.fastmail.com>
In-Reply-To: <fcf4d321-8756-4d50-85f9-b9278fc1b0e0@t-8ch.de>
References: <mpearson-lenovo@squebb.ca>
 <20230317154635.39692-1-mpearson-lenovo@squebb.ca>
 <20230317154635.39692-3-mpearson-lenovo@squebb.ca>
 <23e08752-777b-4af5-8dbb-c57b1afb822f@t-8ch.de>
 <09591551-c653-41c1-99ce-1108febc51d3@app.fastmail.com>
 <fcf4d321-8756-4d50-85f9-b9278fc1b0e0@t-8ch.de>
Date:   Sat, 18 Mar 2023 20:18:42 -0400
From:   "Mark Pearson" <mpearson-lenovo@squebb.ca>
To:     =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>
Cc:     "Hans de Goede" <hdegoede@redhat.com>,
        "markgross@kernel.org" <markgross@kernel.org>,
        "Mark Pearson" <markpearson@lenovo.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH v3 3/3] platform/x86: think-lmi: use correct possible_values
 delimters
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On Sat, Mar 18, 2023, at 8:11 PM, Thomas Wei=C3=9Fschuh wrote:
> On Sat, Mar 18, 2023 at 02:06:28PM -0400, Mark Pearson wrote:
>> Thanks Thomas,
>>=20
>> On Sat, Mar 18, 2023, at 12:39 PM, Thomas Wei=C3=9Fschuh wrote:
>> > On Fri, Mar 17, 2023 at 11:46:35AM -0400, Mark Pearson wrote:
>> >> firmware-attributes class requires that possible values are delimi=
ted
>> >> using ';' but the Lenovo firmware uses ',' instead.
>> >> Parse string and replace where appropriate
>> >>=20
>> >> Thanks to Thomas W for pointing this out.
>
> This could also be a
>
> Reported-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
Good point - will update

>
>> >> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>> >> ---
>> >>  Changes in V3: New patch added to the series. No V1 & V2.
>> >>=20
>> >>  drivers/platform/x86/think-lmi.c | 13 ++++++++++++-
>> >>  1 file changed, 12 insertions(+), 1 deletion(-)
>> >>=20
>> >> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x=
86/think-lmi.c
>> >> index d89a1c9bdbf1..204f1060a533 100644
>> >> --- a/drivers/platform/x86/think-lmi.c
>> >> +++ b/drivers/platform/x86/think-lmi.c
>> >> @@ -1040,7 +1040,7 @@ static ssize_t type_show(struct kobject *kob=
j, struct kobj_attribute *attr,
>> >> =20
>> >>  	if (setting->possible_values) {
>> >>  		/* Figure out what setting type is as BIOS does not return this=
 */
>> >> -		if (strchr(setting->possible_values, ','))
>> >> +		if (strchr(setting->possible_values, ';'))
>> >>  			return sysfs_emit(buf, "enumeration\n");
>> >
>> > I think this patch should be earlier in the series.
>> > So the other patches can work directly from the beginning.
>> OK. I was avoiding refactoring everything - my git skills are not gre=
at. I'll look at doing that.
>
> I would do it like this with an interactive rebase:
>
> b # apply the generic parts of "platform/x86: think-lmi: use correct=20
> possible_values delimters"
> pick c2fbd30a7b15 platform/x86: think-lmi: add missing type attribute
> pick 644923d17048 platform/x86: think-lmi: Add possible_values for=20
> ThinkStation
> f a92fa3cda0d6 platform/x86: think-lmi: use correct possible_values=20
> delimters

Thank you.
I have already done this and I dropped the two last ones and then just c=
reated them manually but with an extra commit thrown in. It worked out p=
retty well and let me clean up other pieces at the same time.=20
Slowly learning...appreciate everyone's patience. Every time I think I h=
ave this figured a review process teaches me otherwise :)

>
>> > Also maybe this needs a Fixes: tag and a Cc: stable@ so it gets
>> > backported.
>
>> I wasn't go to label this for stable as it doesn't really have any
>> real world impact that I know of. I figure the stable team have better
>> things to do then backport minor stuff like this especially with it
>> being in a series. If you feel strongly about it I can add it - though
>> I'd rather only do it once the review is complete given the requests
>> to split patches etc. This series has been way messier then I
>> expected.
>
> The -stable process should be automated with the proper stable Cc.
>
> Given that this technically breaks ABI it may better to keep it out of
> stable, though.
>
> FYI I looked at the only user of this ABI that I know, fwupd, and it
> should gracefully handle this change.
> It accepts both ',' and ';' as separator.
>
>> For the Fixes tag - I don't have anything to reference with this apart
>> from your email. What would I put in there? If you want to raise a
>> bugzilla I'll happy reference that.
>
> The Fixes tag refers to the original commit that introduced the fixed
> issue.
> In this case it would be the commit adding the think-lmi driver:
>
> Fixes: a40cd7ef22fb ("platform/x86: think-lmi: Add WMI interface=20
> support on Lenovo platforms")
>
> Thomas
Ah - got it. Will add. Thanks.

Mark
