Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EC8EC74A5B
	for <platform-driver-x86@archiver.kernel.org>; Sat, 18 Mar 2023 18:00:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbjCRSAB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 18 Mar 2023 14:00:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbjCRSAA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 18 Mar 2023 14:00:00 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A390455AB
        for <platform-driver-x86@vger.kernel.org>; Sat, 18 Mar 2023 10:59:59 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id CD3BA320082A;
        Sat, 18 Mar 2023 13:59:58 -0400 (EDT)
Received: from imap52 ([10.202.2.102])
  by compute5.internal (MEProxy); Sat, 18 Mar 2023 13:59:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
        1679162398; x=1679248798; bh=b/8cFORpaycu+0t3zcGMilbQWi4EJT8AeQ5
        QS3T5U8A=; b=XoQTuLSp986fu7kUXfhNuK2oL694MQBLA3ibhuwj6nDrwtMa0ys
        so7FIy58uEH8Ge4TUBzUGcSCH2svnI2p4lp/uea73Zqtett78PLKtaYQAvWH86w5
        En7BFb/G+WtQT5VxXlkXExcrGFo+qfttfCPmm4Ku+UXchbTsZF2GLU8jQznLzr+f
        ChNK86Ea/XfEzo0I2LSc+iZspvhyoik7/DvFyA48b0OUi09uc9AHkeKNDk4mioou
        +Ud7E+aDYISexYgZ5V+WiI9Oo4+GHoM/afkK7b2Kcj0g6dnHRcljGmL9PAiiySnr
        SMBdc10hMSEgr+acq3zwEkFko6y5k84nxTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1679162398; x=1679248798; bh=b/8cFORpaycu+0t3zcGMilbQWi4EJT8AeQ5
        QS3T5U8A=; b=PsAPas/o8GrxJNq1EhXijw4wBI1lBh7MrtFIw3Ju7uwyzJG+jGq
        jL9VJz+cf7r+2L/BhsNpycemwpEUnzdWrNGpZSXTaMaxrJqGbIP4a6SujHEFcSZj
        jyasluLTrbzZZeqYX262p6bbfAhR26jiHFxjbw3RR8AcLPxypptjTIli1UZciU5Q
        XiSnltjX/iYHOgCXMWeb+A7qfO9INuWure1NEjYdMCQi+RdFfxIj9DRayIyQuHGG
        qajvjpKmWl94ijS+KcTR9BpTUpxOj/wUhAZuc9yyNbJoND7H3bcmp9O0n20mj/fU
        YBuwLNKn5oGyIUfHhIwqaPWKujeVS26HtXw==
X-ME-Sender: <xms:HvwVZIdys5VEKUEVCR2tGSjQaRx_j_KZFdgWOxcBj1RZx1LgxzXBdg>
    <xme:HvwVZKMpt-Q2GabNJZxe3POGKPNh16Y95NlgnXXgQszMBS_11B04b5LQFmyC8QM_Y
    u_2pQO9lCBHYokxJBw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdefgedguddtiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    ofgrrhhkucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvg
    gssgdrtggrqeenucggtffrrghtthgvrhhnpefhfeegudeftefgteelgfekgfdvjeelleev
    gffhjeffhfdtiedtjeefkedvuefgkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdr
    tggr
X-ME-Proxy: <xmx:HvwVZJiECaU3oyDwqMindW-b0ok-N1oifvzNe7u3gMtqDFbBIE_q2A>
    <xmx:HvwVZN9wMSPEUHmZUXb3_bDv839nXPDQaM1eD3ixcWoFkYPuemQb4Q>
    <xmx:HvwVZEstTRMvXtj_FBJaEfNnD-USyBo92GVAIA8tRIqn5ffkGTfzIA>
    <xmx:HvwVZN54tkm0UoUAailOZkPGNvJXpjl0QEQYUCk8j7K3pgVl2ri7DA>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 400A5C60091; Sat, 18 Mar 2023 13:59:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-221-gec32977366-fm-20230306.001-gec329773
Mime-Version: 1.0
Message-Id: <7f8a0183-2da6-4ccb-9dd8-3602e67edd5a@app.fastmail.com>
In-Reply-To: <c6175d59-2000-4145-95a6-b022631bf3a3@t-8ch.de>
References: <mpearson-lenovo@squebb.ca>
 <20230317154635.39692-1-mpearson-lenovo@squebb.ca>
 <20230317154635.39692-2-mpearson-lenovo@squebb.ca>
 <c6175d59-2000-4145-95a6-b022631bf3a3@t-8ch.de>
Date:   Sat, 18 Mar 2023 13:59:38 -0400
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



On Sat, Mar 18, 2023, at 12:35 PM, Thomas Wei=C3=9Fschuh wrote:
> Hi Mark,
>
> please also CC linux-kernel@vger.kernel.org and previous reviewers.

My apologies on previous reviewers - that was a miss on my behalf

I've never cc'd linux-kernel previously - is that a requirement? It's ne=
w to me if it is - what's the reason? (that mailing list seems unusable =
to me from my limited experience...)

Mark
>
> On Fri, Mar 17, 2023 at 11:46:34AM -0400, Mark Pearson wrote:
>> ThinkStation platforms don't support the API to return possible_values
>> but instead embed it in the settings string.
>>=20
>> Try and extract this information and set the possible_values attribute
>> appropriately.
>>=20
>> If there aren't any values possible then don't display possible_value=
s.
>>=20
>> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>> ---
>> Changes in V3:
>>  - Use is_visible attribute to determine if possible_values should be
>>    available
>>  - Code got refactored a bit to make compilation cleaner
>> Changes in V2:
>>  - Move no value for possible_values handling into show function
>>  - use kstrndup for allocating string
>>=20
>>  drivers/platform/x86/think-lmi.c | 82 ++++++++++++++++++++++--------=
--
>>  1 file changed, 56 insertions(+), 26 deletions(-)
>>=20
>> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/=
think-lmi.c
>> index 5fa5451c4802..d89a1c9bdbf1 100644
>> --- a/drivers/platform/x86/think-lmi.c
>> +++ b/drivers/platform/x86/think-lmi.c
>> @@ -917,6 +917,8 @@ static ssize_t display_name_show(struct kobject *=
kobj, struct kobj_attribute *at
>>  	return sysfs_emit(buf, "%s\n", setting->display_name);
>>  }
>> =20
>> +static struct kobj_attribute attr_displ_name =3D __ATTR_RO(display_n=
ame);
>> +
>>  static ssize_t current_value_show(struct kobject *kobj, struct kobj_=
attribute *attr, char *buf)
>>  {
>>  	struct tlmi_attr_setting *setting =3D to_tlmi_attr_setting(kobj);
>> @@ -937,30 +939,6 @@ static ssize_t current_value_show(struct kobject=
 *kobj, struct kobj_attribute *a
>>  	return ret;
>>  }
>> =20
>> -static ssize_t possible_values_show(struct kobject *kobj, struct kob=
j_attribute *attr, char *buf)
>> -{
>> -	struct tlmi_attr_setting *setting =3D to_tlmi_attr_setting(kobj);
>> -
>> -	if (!tlmi_priv.can_get_bios_selections)
>> -		return -EOPNOTSUPP;
>> -
>> -	return sysfs_emit(buf, "%s\n", setting->possible_values);
>> -}
>> -
>> -static ssize_t type_show(struct kobject *kobj, struct kobj_attribute=
 *attr,
>> -		char *buf)
>> -{
>> -	struct tlmi_attr_setting *setting =3D to_tlmi_attr_setting(kobj);
>> -
>> -	if (setting->possible_values) {
>> -		/* Figure out what setting type is as BIOS does not return this */
>> -		if (strchr(setting->possible_values, ','))
>> -			return sysfs_emit(buf, "enumeration\n");
>> -	}
>> -	/* Anything else is going to be a string */
>> -	return sysfs_emit(buf, "string\n");
>> -}
>> -
>>  static ssize_t current_value_store(struct kobject *kobj,
>>  		struct kobj_attribute *attr,
>>  		const char *buf, size_t count)
>> @@ -1044,14 +1022,46 @@ static ssize_t current_value_store(struct kob=
ject *kobj,
>>  	return ret ?: count;
>>  }
>> =20
>> -static struct kobj_attribute attr_displ_name =3D __ATTR_RO(display_n=
ame);
>> +static struct kobj_attribute attr_current_val =3D __ATTR_RW_MODE(cur=
rent_value, 0600);
>> +
>> +static ssize_t possible_values_show(struct kobject *kobj, struct kob=
j_attribute *attr, char *buf)
>> +{
>> +	struct tlmi_attr_setting *setting =3D to_tlmi_attr_setting(kobj);
>> +
>> +	return sysfs_emit(buf, "%s\n", setting->possible_values);
>> +}
>> =20
>>  static struct kobj_attribute attr_possible_values =3D __ATTR_RO(poss=
ible_values);
>> =20
>> -static struct kobj_attribute attr_current_val =3D __ATTR_RW_MODE(cur=
rent_value, 0600);
>> +static ssize_t type_show(struct kobject *kobj, struct kobj_attribute=
 *attr,
>> +		char *buf)
>> +{
>> +	struct tlmi_attr_setting *setting =3D to_tlmi_attr_setting(kobj);
>> +
>> +	if (setting->possible_values) {
>> +		/* Figure out what setting type is as BIOS does not return this */
>> +		if (strchr(setting->possible_values, ','))
>> +			return sysfs_emit(buf, "enumeration\n");
>> +	}
>> +	/* Anything else is going to be a string */
>> +	return sysfs_emit(buf, "string\n");
>> +}
>
> This patch seems to introduce a lot of churn, is it intentional?
>> =20
>>  static struct kobj_attribute attr_type =3D __ATTR_RO(type);
>> =20
>> +static umode_t attr_is_visible(struct kobject *kobj,
>> +					     struct attribute *attr, int n)
>> +{
>> +	struct tlmi_attr_setting *setting =3D to_tlmi_attr_setting(kobj);
>> +
>> +	/* We don't want to display possible_values attributes if not avail=
able */
>> +	if (attr =3D=3D (struct attribute *)&attr_possible_values)
>
> This cast is unsafe, if the struct kobj_attribute order is randomised =
it
> will break.
>
> You can use
>
> 	if (attr =3D=3D &attr_possible_values.attr)
>
>> +		if (!setting->possible_values)
>> +			return 0;
>> +
>> +	return attr->mode;
>> +}
>> +
>>  static struct attribute *tlmi_attrs[] =3D {
>>  	&attr_displ_name.attr,
>>  	&attr_current_val.attr,
>> @@ -1061,6 +1071,7 @@ static struct attribute *tlmi_attrs[] =3D {
>>  };
>> =20
>>  static const struct attribute_group tlmi_attr_group =3D {
>> +	.is_visible =3D attr_is_visible,
>>  	.attrs =3D tlmi_attrs,
>>  };
>> =20
>> @@ -1440,6 +1451,25 @@ static int tlmi_analyze(void)
>>  			if (ret || !setting->possible_values)
>>  				pr_info("Error retrieving possible values for %d : %s\n",
>>  						i, setting->display_name);
>> +		} else {
>> +			/*
>> +			 * Older Thinkstations don't support the bios_selections API.
>> +			 * Instead they store this as a [Optional:Option1,Option2] sectio=
n of the
>> +			 * name string.
>> +			 * Try and pull that out if it's available.
>> +			 */
>> +			char *item, *optstart, *optend;
>> +
>> +			if (!tlmi_setting(setting->index, &item, LENOVO_BIOS_SETTING_GUID=
)) {
>> +				optstart =3D strstr(item, "[Optional:");
>> +				if (optstart) {
>> +					optstart +=3D strlen("[Optional:");
>> +					optend =3D strstr(optstart, "]");
>> +					if (optend)
>> +						setting->possible_values =3D
>> +							kstrndup(optstart, optend - optstart, GFP_KERNEL);
>> +				}
>> +			}
>
> The patch now does two things:
> 1) Hide the sysfs attributes if the value is not available
> 2) Extract the value from the description
>
> Maybe it could be split in two?
>
> Another observation:
> Would it make sense to remove the part
> "[Optional:Option1,Option2]" from the name attribute?
>
>>  		}
>>  		kobject_init(&setting->kobj, &tlmi_attr_setting_ktype);
>>  		tlmi_priv.setting[i] =3D setting;
>> --=20
>> 2.39.2
>>
