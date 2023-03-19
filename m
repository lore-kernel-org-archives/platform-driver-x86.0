Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A06C6C74A5B
	for <platform-driver-x86@archiver.kernel.org>; Sun, 19 Mar 2023 00:09:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbjCSAJV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 18 Mar 2023 20:09:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjCSAJU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 18 Mar 2023 20:09:20 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65F9F2820E
        for <platform-driver-x86@vger.kernel.org>; Sat, 18 Mar 2023 17:09:19 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id CE8475C00FF;
        Sat, 18 Mar 2023 20:09:18 -0400 (EDT)
Received: from imap52 ([10.202.2.102])
  by compute5.internal (MEProxy); Sat, 18 Mar 2023 20:09:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
        1679184558; x=1679270958; bh=diPCZi+MEGDqg1aRXa1zNo2iA1UEy9EpmZp
        u3CVpTDE=; b=JNaqk8kJzn7MEhruXBj9h30rt+Q2jS0aqW/2LytXb/S+9ouBwDm
        IncodCzL7wkkggY4xj6cLUJykGOp4TwGY50nkhH0SsOIv2mAQmc9egPFm80Wag34
        JDbGNeIfOmAyYsj1TrjFZE6ggVIj4ASHy7CT654MH+nYamg4bX9rl8Po0zKIBMDp
        skgAuySvHAfHHYDC7a29vxWKmBJGnrfmLkTGsl3yvOvZq136flrYtsPfeagK9zrV
        Qf8L6i96fILp2HklIAN9E9/P84ln6Q/ZWGqWIxeFVPvPvgehOnSG4IJ5Rk+rY+vk
        Lv/0bLfjrs2EzFOirpSntaIt2XaQmIHQ32Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1679184558; x=1679270958; bh=diPCZi+MEGDqg1aRXa1zNo2iA1UEy9EpmZp
        u3CVpTDE=; b=onSagBYEger5rJBWxixV72w2UXuzWODJBiyXRkOOhfbe2c5ASDo
        ANehNnxlIv+4ITdR2IzZuGMpMMDlN5Bxwy1zhPOw9RiK/tfEIUT1BmWR71/dDj0P
        BggbighmbIasLmDCIto8Fewybdxz7k16Z8/difYRQ4u0cjLBNEWdJL0noaMTsNUQ
        +ZyO72oFbeclanVNiKBXALFuvFa4FsCTBiHQlOz7n7psqPjEKneinx4WTmxYsPDP
        gCckvvGq23UrsVMvUIL7kRHQoSYlBNeoVRiY/+vlKpzmpSyfPntT5Fk/K6RtTdQ0
        +awuesu4zv4AZU8t8P4UFp/dhju6wvtjnXg==
X-ME-Sender: <xms:rlIWZCU1Ak8Op39hiXr0ZtWbiXclrNiYMw0zu1Yq5WAMBT2iYPuUYg>
    <xme:rlIWZOn6wfuGqXnwPqnBBsZw9je2OtR-IZvd1bxwOhpNqfRzlgB4V94kkxGpokKpN
    Tb-aqb3_HjWu5aTPXM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdefhedgudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfo
    rghrkhcurfgvrghrshhonhdfuceomhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsg
    gsrdgtrgeqnecuggftrfgrthhtvghrnhephfefgedufeetgfetlefgkefgvdejleelvefg
    hfejfffhtdeitdejfeekvdeugfeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepmhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgt
    rg
X-ME-Proxy: <xmx:rlIWZGaDMc1QSj4u8DiMspE0XUfFtl3Kwd3lzkdP9-pguz4hsIIcWQ>
    <xmx:rlIWZJUCDrWYdIAIvlgnSbDcdLiDwXClwUOeQHN77wG5PV0Lo5NZpA>
    <xmx:rlIWZMm76IDde7jnCuwxFZxB6gcrCynIoG4zRcmqOs8VsdbhSAWK8g>
    <xmx:rlIWZBwZeuLJckpq8j-2aYFZBNvvRvGqEvlS90-uxWQ8_iuCXEIAXg>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 9F725C60091; Sat, 18 Mar 2023 20:09:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-221-gec32977366-fm-20230306.001-gec329773
Mime-Version: 1.0
Message-Id: <aa2f353f-6da5-4ec2-8a83-bffe310bd7b0@app.fastmail.com>
In-Reply-To: <e56512fa-b738-44f5-9dc4-57d46c994afd@t-8ch.de>
References: <mpearson-lenovo@squebb.ca>
 <20230317154635.39692-1-mpearson-lenovo@squebb.ca>
 <20230317154635.39692-2-mpearson-lenovo@squebb.ca>
 <c6175d59-2000-4145-95a6-b022631bf3a3@t-8ch.de>
 <da0c88a5-d03f-4dc2-939d-f1e60bc7d3cc@app.fastmail.com>
 <e56512fa-b738-44f5-9dc4-57d46c994afd@t-8ch.de>
Date:   Sat, 18 Mar 2023 20:08:58 -0400
From:   "Mark Pearson" <mpearson-lenovo@squebb.ca>
To:     =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>
Cc:     "Hans de Goede" <hdegoede@redhat.com>,
        "markgross@kernel.org" <markgross@kernel.org>,
        "Mark Pearson" <markpearson@lenovo.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] platform/x86: think-lmi: Add possible_values for
 ThinkStation
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sat, Mar 18, 2023, at 7:52 PM, Thomas Wei=C3=9Fschuh wrote:
> On Sat, Mar 18, 2023 at 01:53:33PM -0400, Mark Pearson wrote:
>> Thanks Thomas
>>=20
>> On Sat, Mar 18, 2023, at 12:35 PM, Thomas Wei=C3=9Fschuh wrote:
>> > Hi Mark,
>> >
>> > please also CC linux-kernel@vger.kernel.org and previous reviewers.
>> >
>> > On Fri, Mar 17, 2023 at 11:46:34AM -0400, Mark Pearson wrote:
>> >> -static struct kobj_attribute attr_current_val =3D __ATTR_RW_MODE(=
current_value, 0600);
>> >> +static ssize_t type_show(struct kobject *kobj, struct kobj_attrib=
ute *attr,
>> >> +		char *buf)
>> >> +{
>> >> +	struct tlmi_attr_setting *setting =3D to_tlmi_attr_setting(kobj);
>> >> +
>> >> +	if (setting->possible_values) {
>> >> +		/* Figure out what setting type is as BIOS does not return this=
 */
>> >> +		if (strchr(setting->possible_values, ','))
>> >> +			return sysfs_emit(buf, "enumeration\n");
>> >> +	}
>> >> +	/* Anything else is going to be a string */
>> >> +	return sysfs_emit(buf, "string\n");
>> >> +}
>> >
>> > This patch seems to introduce a lot of churn, is it intentional?
>> Yes(ish). It got cleaned up as the functions were in a weird order wh=
en I introduced the is_visible. The actual changes are very small - but =
it did make it look messier than it really is.
>> Is this a big concern? I know it makes the review a bit more painful =
and my apologies for that.
>
> Not a big concern. The shuffling around could be done in a dedicated
> patch that explicitly only moves code around.
>
>> >> @@ -1440,6 +1451,25 @@ static int tlmi_analyze(void)
>> >>  			if (ret || !setting->possible_values)
>> >>  				pr_info("Error retrieving possible values for %d : %s\n",
>> >>  						i, setting->display_name);
>> >> +		} else {
>> >> +			/*
>> >> +			 * Older Thinkstations don't support the bios_selections API.
>> >> +			 * Instead they store this as a [Optional:Option1,Option2] sec=
tion of the
>> >> +			 * name string.
>> >> +			 * Try and pull that out if it's available.
>> >> +			 */
>> >> +			char *item, *optstart, *optend;
>> >> +
>> >> +			if (!tlmi_setting(setting->index, &item, LENOVO_BIOS_SETTING_G=
UID)) {
>> >> +				optstart =3D strstr(item, "[Optional:");
>> >> +				if (optstart) {
>> >> +					optstart +=3D strlen("[Optional:");
>> >> +					optend =3D strstr(optstart, "]");
>> >> +					if (optend)
>> >> +						setting->possible_values =3D
>> >> +							kstrndup(optstart, optend - optstart, GFP_KERNEL);
>> >> +				}
>> >> +			}
>> >
>> > The patch now does two things:
>> > 1) Hide the sysfs attributes if the value is not available
>> > 2) Extract the value from the description
>> >
>> > Maybe it could be split in two?
>> Sure. I did contemplate that and then ultimately decided it was all f=
rom the same intent so left it. But I can split.
>
> Would look nicer to me, but it's only one opinion.

I have worked through this and it is nicer. Next version will be split (=
and I unwound some of the code re-org too).
I'm going to hold off a couple of days before pushing the changes for re=
view in case there are other pieces of feedback.

Mark
