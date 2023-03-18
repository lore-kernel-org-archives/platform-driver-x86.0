Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE50BC74A5B
	for <platform-driver-x86@archiver.kernel.org>; Sat, 18 Mar 2023 17:54:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbjCRRyN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 18 Mar 2023 13:54:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbjCRRyN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 18 Mar 2023 13:54:13 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC42712596
        for <platform-driver-x86@vger.kernel.org>; Sat, 18 Mar 2023 10:54:11 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 7E7673200786;
        Sat, 18 Mar 2023 13:54:08 -0400 (EDT)
Received: from imap52 ([10.202.2.102])
  by compute5.internal (MEProxy); Sat, 18 Mar 2023 13:54:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
        1679162048; x=1679248448; bh=/M0HCPF+J4a+72MFFgEKuJYa2hggsPf1lcw
        9ZsUJiHw=; b=rMXpzsMaUuBaXCwNqZpYs+8RWNJXKpO/cQEVqH0dZQXaYzJYdKs
        EtFFelP27CmlzuII1GXAGnQhlwEPbR1/tpcmFp1ZI2CypedqJYpPyj4YF46KyBf0
        6+2gHKeEDFMckZESrzY5IEvxqLYbL2+H/FS5k9k3L9e/D0NZh8IMRFfaQHnp4QwE
        5aio4bhPR70z69M2lNocIU204A8FpzU1DKMAaUi1wR0Q2UhTiJEJx52rKxg4wXWn
        +DSgSuJPonq3r8AYnYkFuKALQYwwS3cHrnWut5rka3so/WJdFL6nv+KYWmFcgYQN
        VrsSc3za+Iu3jeBs7rZvqZxpKByzXj8NBfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1679162048; x=1679248448; bh=/M0HCPF+J4a+72MFFgEKuJYa2hggsPf1lcw
        9ZsUJiHw=; b=sqHKe3+dXUnwiSfwANphqJjuXhdKnJrb61NPj55i3Ijez9NwwDI
        KSIahNa+dpmRH5NyNBFjcn2lR1p90SDTSSWgafiRI0TZ7JYvcFhy/kjDo7eESkFr
        hPj6CbyJyP5hwkUxJNJUrqtCQEQX2/eqCcOke5XzvnxAlADoggk4dVd/pXzBgJZy
        cjy3HbqBwCjGESpMu7vMWjDwSiX339nViAhRXXzSSCZ5UhNDUjC0YGrzpG4MnIDz
        BQZu/kea0INWrJvhxRbptRQ6VH88i35yMnhWzRDUl/YgaS5X3E/3a0GYaXhx457V
        0D2nVm5EzxEQWMRXM1YkcT7CTAUqSacCJ8g==
X-ME-Sender: <xms:v_oVZCYudFvnnH5LhWQQ7N6AYwLPzFfkoKwvFVLQ89Up1-aqqAj9BA>
    <xme:v_oVZFbm6xgtHFho4gXHDNLEaacpLwc2h9enRmlvDu4c6bEKysbPJZlD5U2LB1yF7
    _cXYc5MvCUg62-uvbY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdefgedguddthecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    ofgrrhhkucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvg
    gssgdrtggrqeenucggtffrrghtthgvrhhnpefhfeegudeftefgteelgfekgfdvjeelleev
    gffhjeffhfdtiedtjeefkedvuefgkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdr
    tggr
X-ME-Proxy: <xmx:v_oVZM-uCnDzdCi2V3fyFb6SmFy0dBgX7j4vNTDNUnDW-i8QIyeeoA>
    <xmx:v_oVZErUUTsPNGeN6l08F3D09nhkkG3KHrzh-JjTxTmVJrJKMskmBQ>
    <xmx:v_oVZNqjDeMbGWhjFEOObDvZqH6Xi8rHUboke4nEfbMHwo_cPX1IkA>
    <xmx:wPoVZE2S045OhA552d8A-meOPbWt6kuSeVA-qe4kz5D1bIBYmeTjrg>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id C79B6C60091; Sat, 18 Mar 2023 13:54:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-221-gec32977366-fm-20230306.001-gec329773
Mime-Version: 1.0
Message-Id: <da0c88a5-d03f-4dc2-939d-f1e60bc7d3cc@app.fastmail.com>
In-Reply-To: <c6175d59-2000-4145-95a6-b022631bf3a3@t-8ch.de>
References: <mpearson-lenovo@squebb.ca>
 <20230317154635.39692-1-mpearson-lenovo@squebb.ca>
 <20230317154635.39692-2-mpearson-lenovo@squebb.ca>
 <c6175d59-2000-4145-95a6-b022631bf3a3@t-8ch.de>
Date:   Sat, 18 Mar 2023 13:53:33 -0400
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

Thanks Thomas

On Sat, Mar 18, 2023, at 12:35 PM, Thomas Wei=C3=9Fschuh wrote:
> Hi Mark,
>
> please also CC linux-kernel@vger.kernel.org and previous reviewers.
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
Yes(ish). It got cleaned up as the functions were in a weird order when =
I introduced the is_visible. The actual changes are very small - but it =
did make it look messier than it really is.
Is this a big concern? I know it makes the review a bit more painful and=
 my apologies for that.

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
Ack. Will change.

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
Sure. I did contemplate that and then ultimately decided it was all from=
 the same intent so left it. But I can split.

>
> Another observation:
> Would it make sense to remove the part
> "[Optional:Option1,Option2]" from the name attribute?
>
I considered this previously and I was concerned about if this could hav=
e impacts that I couldn't foresee. The BIOS teams do strange things with=
 this string so I was playing safe and leaving it alone (especially as i=
t differs across the different portfolios)

I know it would be nice to have one standard for everything but sadly th=
at's not the case, and not a battle I can win.

>>  		}
>>  		kobject_init(&setting->kobj, &tlmi_attr_setting_ktype);
>>  		tlmi_priv.setting[i] =3D setting;
>> --=20
>> 2.39.2
>>
