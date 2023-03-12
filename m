Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2466CC6FA99
	for <platform-driver-x86@archiver.kernel.org>; Sun, 12 Mar 2023 13:21:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbjCLNV5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 12 Mar 2023 09:21:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbjCLNV4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 12 Mar 2023 09:21:56 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C667131E0C
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Mar 2023 06:21:23 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 1BA205C0125;
        Sun, 12 Mar 2023 09:20:04 -0400 (EDT)
Received: from imap52 ([10.202.2.102])
  by compute5.internal (MEProxy); Sun, 12 Mar 2023 09:20:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1678627204; x=1678713604; bh=fb6iy9BVWgDRTgwE5rFxWDlfcZJlM0G1SeT
        HPrKaYsM=; b=WGSDKyESJ9fC2IKr1tYhmD21pDmYXDUCckKcqRvbcLw9Dcs6/c7
        JfRwixXFQEAPfRVKMHxjbcvrZCLb7nGByLyvzzV8AnRQuSOcIEZHl+2J6aCYb/kP
        MW1wcRtltPCNGTGN74gagHcqm88f2WWI35plWF4NzO22q+ZgPyUdfSHba7AvySpv
        OCC0s/DJOYH8rRmXKKGSphtvbebg2C5gAh1BI5DDNqpy3a22zipsUj33XnORBVHp
        ipAwvOzpNUH/1Crmoop1aV785FEh05+NsRgYLeYGkCuMCKaqPWDFBrT6ysQxQZzX
        gxy4CRXOEp2f2Fzoo+hTtfixMF2ubJYk24Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1678627204; x=1678713604; bh=fb6iy9BVWgDRTgwE5rFxWDlfcZJlM0G1SeT
        HPrKaYsM=; b=HRjmiNi4cz/+7JDdD9yzNlPfWIyZLbNFeL8DRzu9zC8r5g9QWHa
        zJipvjjjlJb4CQ1KI5+JUCj+aOWryIxQPnQRBIbQL7hFtzBGtA0DB4vd84fBbqfD
        QnInxYvFBmlEn1adptsdxwvrsWOsPEWPNfJxXNtwW0PShBoncp9jkMgTakqLYgMk
        B465D8PexiUjFW/DVYLQVpVEeXhOjKGhVwFR7KpSv9z08Uz/Bgd9Nd2ambGwTNNY
        35154l+MPAXvrNh5vNwlHXWkSNpkKhw00eussNRAjQp29V+008t9Zkl+s58vPpVZ
        J++MkQDFOW0K+cqZcF59+jq5UudOM8vxPhA==
X-ME-Sender: <xms:g9ENZGKNaYjQYtPvD3Hf-8lQ63u34ijBuOloVkhJqmOfh5u701TZEg>
    <xme:g9ENZOJaRYT4PeVi5POaL8enXDE3XADCfJZPhB9lW6kRzAJRduqN9eOI3XnKBgjuh
    USbIJbOAdrBtSDMv9o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddvvddggeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfo
    rghrkhcurfgvrghrshhonhdfuceomhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsg
    gsrdgtrgeqnecuggftrfgrthhtvghrnhepfeejgedvudegvdekhedvffefjefhuedthfdt
    heehkeffuddvgfetjeegjeeufefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmphgvrghr
    shhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggr
X-ME-Proxy: <xmx:g9ENZGsW51zWllEzRHtqSpL1q8BGq5gnZKJjWYwdCdESvVYRk556Eg>
    <xmx:g9ENZLYZEOZCVlPAf7s_lmCeniB8JmAPhUBP7tEcqaDNJkUVufNJZQ>
    <xmx:g9ENZNY6ADD66eUJioMfliFCtJUMUiA1lD1rW8HTYyPjDL2UXVS8Ag>
    <xmx:hNENZMmMS3wgK5E4d2FMDkahNTFTz-Dh9NEdgSBlvCgFPBNEqAh5cQ>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id C3D5AC60091; Sun, 12 Mar 2023 09:20:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-206-g57c8fdedf8-fm-20230227.001-g57c8fded
Mime-Version: 1.0
Message-Id: <1815e7b3-8199-46e9-aa3d-1d31bd14001f@app.fastmail.com>
In-Reply-To: <87957353-0778-46ca-9906-411022b55ded@app.fastmail.com>
References: <mpearson-lenovo@squebb.ca>
 <20230312024635.518769-1-mpearson-lenovo@squebb.ca>
 <0bc6d16a-5c58-462b-92d5-d827d92b65ed@t-8ch.de>
 <87957353-0778-46ca-9906-411022b55ded@app.fastmail.com>
Date:   Sun, 12 Mar 2023 09:19:29 -0400
From:   "Mark Pearson" <mpearson-lenovo@squebb.ca>
To:     =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>
Cc:     "Hans de Goede" <hdegoede@redhat.com>,
        "markgross@kernel.org" <markgross@kernel.org>,
        "Mark Pearson" <markpearson@lenovo.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH 1/2] platform/x86: think-lmi: add missing type attribute
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Apologies for the duplication, I forgot to set email format as text so i=
t got bounced by the mailing list. Resending.
Mark

On Sat, Mar 11, 2023, at 10:44 PM, Mark Pearson wrote:
> Thanks Thomas
>=20
> On Sat, Mar 11, 2023, at 10:33 PM, Thomas Wei=C3=9Fschuh wrote:
>> On Sat, Mar 11, 2023 at 09:46:34PM -0500, Mark Pearson wrote:
>> > This driver was missing the mandatory type attribute...oops.
>> >=20
>> > Add it in along with logic to determine whether the attribute is an
>> > enumeration type or a string by parsing the possible_values attribu=
te.
>> >=20
>> > Some platforms (and some attributes) don't return possible_values s=
o to
>> > prevent trying to scan NULL strings mark these as "N/A".
>> >=20
>> > Fixes: https://bugzilla.kernel.org/show_bug.cgi?id=3D216460
>>=20
>> Afaik Fixes: is only for references to commits.
>> Instead a Reported-by/Link would be better.
> Ah - thanks. My bad.
>=20
>>=20
>> > Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>> > ---
>> >  drivers/platform/x86/think-lmi.c | 26 +++++++++++++++++++++++---
>> >  drivers/platform/x86/think-lmi.h |  6 ++++++
>> >  2 files changed, 29 insertions(+), 3 deletions(-)
>> >=20
>> > diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x8=
6/think-lmi.c
>> > index 86b33b74519b..495a5e045069 100644
>> > --- a/drivers/platform/x86/think-lmi.c
>> > +++ b/drivers/platform/x86/think-lmi.c
>> > @@ -941,12 +941,18 @@ static ssize_t possible_values_show(struct ko=
bject *kobj, struct kobj_attribute
>> >  {
>> >  struct tlmi_attr_setting *setting =3D to_tlmi_attr_setting(kobj);
>> > =20
>> > - if (!tlmi_priv.can_get_bios_selections)
>> > - return -EOPNOTSUPP;
>> > -
>> >  return sysfs_emit(buf, "%s\n", setting->possible_values);
>> >  }
>> > =20
>> > +static ssize_t type_show(struct kobject *kobj, struct kobj_attribu=
te *attr,
>> > + char *buf)
>> > +{
>> > + struct tlmi_attr_setting *setting =3D to_tlmi_attr_setting(kobj);
>> > +
>> > + return sysfs_emit(buf, "%s\n",
>> > + setting->type =3D=3D TLMI_ENUMERATION ? "enumeration" : "string");
>> > +}
>> > +
>> >  static ssize_t current_value_store(struct kobject *kobj,
>> >  struct kobj_attribute *attr,
>> >  const char *buf, size_t count)
>> > @@ -1036,10 +1042,13 @@ static struct kobj_attribute attr_possible_=
values =3D __ATTR_RO(possible_values);
>> > =20
>> >  static struct kobj_attribute attr_current_val =3D __ATTR_RW_MODE(c=
urrent_value, 0600);
>> > =20
>> > +static struct kobj_attribute attr_type =3D __ATTR_RO(type);
>> > +
>> >  static struct attribute *tlmi_attrs[] =3D {
>> >  &attr_displ_name.attr,
>> >  &attr_current_val.attr,
>> >  &attr_possible_values.attr,
>> > + &attr_type.attr,
>> >  NULL
>> >  };
>> > =20
>> > @@ -1424,6 +1433,17 @@ static int tlmi_analyze(void)
>> >  pr_info("Error retrieving possible values for %d : %s\n",
>> >  i, setting->display_name);
>> >  }
>> > + /* If we don't have a possible value mark as N/A */
>> > + if (!setting->possible_values) {
>> > + setting->possible_values =3D kmalloc(strlen("N/A"), GFP_KERNEL);
>>=20
>> kmalloc() can fail.
>>=20
>> > + sprintf(setting->possible_values, "N/A");
>>=20
>> This writes the '\0' out of bounds?
>>=20
>> kmalloc() and sprintf() could be replaced with kstrdup().
>>=20
>> Instead of having to do allocations, check for failure, worry about h=
ow
>> sysfs_emit() will handle the NULL it would be easier to just check of
>> NULL inside possible_values_show() and fall back to N/A there.
> Good point - that would be better. I'll update.
>=20
>>=20
>> > + }
>> > + /* Figure out what setting type is as BIOS does not return this */
>> > + if (strchr(setting->possible_values, ','))
>>=20
>> possible_values could be NULL if the sprintf would not have dereferen=
ced
>> it before.
> Agreed. This was part of the reason I'd put in the N/A to cover for th=
at case (so it should never be NULL). But I'll revisit this.
>=20
>>=20
>> > + setting->type =3D TLMI_ENUMERATION;
>> > + else
>> > + setting->type =3D TLMI_STRING;
>> > +
>>=20
>> Is it worth introducing a new enum and field in struct
>> tlmi_attr_setting?
>> The check could also be done directly in type_show().
>> (with a NULL-check).
> Ack, this makes sense. I'll look at doing that.
>=20
> Many thanks for the review
> Mark
