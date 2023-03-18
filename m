Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B672C74A5B
	for <platform-driver-x86@archiver.kernel.org>; Sat, 18 Mar 2023 18:06:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbjCRSGx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 18 Mar 2023 14:06:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjCRSGw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 18 Mar 2023 14:06:52 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76C682F79E
        for <platform-driver-x86@vger.kernel.org>; Sat, 18 Mar 2023 11:06:51 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id AA2AF320082A;
        Sat, 18 Mar 2023 14:06:50 -0400 (EDT)
Received: from imap52 ([10.202.2.102])
  by compute5.internal (MEProxy); Sat, 18 Mar 2023 14:06:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
        1679162810; x=1679249210; bh=Q64hiImr//JcWWgugUePN7T1axrW8ohDKwa
        spWoKpyM=; b=OZYUD5k2QpZgt8CV1q3a46epbpYJ5XaQFfh87MAbWnkNtrbKBkg
        cb0FAvnlDCC9JlSkMMnPHLjWEBk0YTDv7KikRR46scfJcqeuOmnoF3Z6D0DHJzL6
        6hE8kQICUOIUfpD7CM5XRha3Yxy6CSDWJHTBe+mCjMNFRrTBGrXmZ3bLqj85B/rq
        5vQNo4F9isw/o4Mh+uqstaL+iIK1swzHC1w+gFJ1fq+7AenKk30w3LwolBm1XSri
        0inPeE6cE1n3X4PjKPcVziu/jhVhlG/4pU4mU4rmKCv5VJVMkBoaJLqLXiVj3Kso
        W/Yn6YCgd7ksswmETof8op7kazNgypGjkrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1679162810; x=1679249210; bh=Q64hiImr//JcWWgugUePN7T1axrW8ohDKwa
        spWoKpyM=; b=AqtgfZUaF6hCDAhdIMlGKN/r1JYMLy/XyHDu8jgx23d/0l1SRND
        hyUw2dbaNPqLTSzEBFmi6ana9/hNMXj4iwL7I5URpJmgrGYioA0n9KsaXpoUGOTT
        HDcORsfrCEO//XAQPElF8uW/JXzgxSA4DjlNYLx8VqOuu4wLYKIEFFjh2bSklSCW
        EXgjhcf9ZA/0p5YnUmJppsoxRWr919tMJkKDsGFbyZyHSFmuADD9OADdEZ6TOpBD
        0o9wj2Qs2J0LQ1ZHUzSyzxnSUyKh699AlUvsF5zZ83zIbWWYgV7I1qr9jrdyw/Ns
        +Sdc5Lfuvd+WcsqlrMOzV7hs4hHF73SwJoQ==
X-ME-Sender: <xms:uf0VZJyF-ZbydydLgQ6NxEph33JOIsRbVxfu-uSYgqWNQDpYx4Bspw>
    <xme:uf0VZJQnDjJiSQ0cJ-vp-zcx_IhwBlyYEEYNoWypRPaEg8R652Do3dXS-UJmF0zPJ
    vEs9CZ7Bry7CcaDjL8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdefgedguddtjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    ofgrrhhkucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvg
    gssgdrtggrqeenucggtffrrghtthgvrhhnpefhfeegudeftefgteelgfekgfdvjeelleev
    gffhjeffhfdtiedtjeefkedvuefgkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdr
    tggr
X-ME-Proxy: <xmx:uf0VZDUqZtNJnkMuCEjfFOSdFLuRP7Khe0VOd7xYDSUq9PmR7QmaTA>
    <xmx:uf0VZLgCK_DvIjOZLjXeluLao3tvymojBrfZdmr8bH2rCIPVBCZJeg>
    <xmx:uf0VZLA8pTRkCG2hSdkqIfmZTnTT6X-w7xIIOv90MPf0_ik8PGsZTA>
    <xmx:uv0VZOMvOTwa7PrH-FHZ2OGa-hKg0H6p4dpBCVQZL6oRfnmnkpdh7A>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id E3A59C60091; Sat, 18 Mar 2023 14:06:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-221-gec32977366-fm-20230306.001-gec329773
Mime-Version: 1.0
Message-Id: <09591551-c653-41c1-99ce-1108febc51d3@app.fastmail.com>
In-Reply-To: <23e08752-777b-4af5-8dbb-c57b1afb822f@t-8ch.de>
References: <mpearson-lenovo@squebb.ca>
 <20230317154635.39692-1-mpearson-lenovo@squebb.ca>
 <20230317154635.39692-3-mpearson-lenovo@squebb.ca>
 <23e08752-777b-4af5-8dbb-c57b1afb822f@t-8ch.de>
Date:   Sat, 18 Mar 2023 14:06:28 -0400
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

Thanks Thomas,

On Sat, Mar 18, 2023, at 12:39 PM, Thomas Wei=C3=9Fschuh wrote:
> On Fri, Mar 17, 2023 at 11:46:35AM -0400, Mark Pearson wrote:
>> firmware-attributes class requires that possible values are delimited
>> using ';' but the Lenovo firmware uses ',' instead.
>> Parse string and replace where appropriate
>>=20
>> Thanks to Thomas W for pointing this out.
>>=20
>> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>> ---
>>  Changes in V3: New patch added to the series. No V1 & V2.
>>=20
>>  drivers/platform/x86/think-lmi.c | 13 ++++++++++++-
>>  1 file changed, 12 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/=
think-lmi.c
>> index d89a1c9bdbf1..204f1060a533 100644
>> --- a/drivers/platform/x86/think-lmi.c
>> +++ b/drivers/platform/x86/think-lmi.c
>> @@ -1040,7 +1040,7 @@ static ssize_t type_show(struct kobject *kobj, =
struct kobj_attribute *attr,
>> =20
>>  	if (setting->possible_values) {
>>  		/* Figure out what setting type is as BIOS does not return this */
>> -		if (strchr(setting->possible_values, ','))
>> +		if (strchr(setting->possible_values, ';'))
>>  			return sysfs_emit(buf, "enumeration\n");
>
> I think this patch should be earlier in the series.
> So the other patches can work directly from the beginning.
OK. I was avoiding refactoring everything - my git skills are not great.=
 I'll look at doing that.

>
> Also maybe this needs a Fixes: tag and a Cc: stable@ so it gets
> backported.
I wasn't go to label this for stable as it doesn't really have any real =
world impact that I know of. I figure the stable team have better things=
 to do then backport minor stuff like this especially with it being in a=
 series. If you feel strongly about it I can add it - though I'd rather =
only do it once the review is complete given the requests to split patch=
es etc. This series has been way messier then I expected.

For the Fixes tag - I don't have anything to reference with this apart f=
rom your email. What would I put in there? If you want to raise a bugzil=
la I'll happy reference that.

Mark

>
>>  	}
>>  	/* Anything else is going to be a string */
>> @@ -1471,6 +1471,17 @@ static int tlmi_analyze(void)
>>  				}
>>  			}
>>  		}
>> +		/*
>> +		 * firmware-attributes requires that possible_values are separated=
 by ';' but
>> +		 * Lenovo FW uses ','. Replace appropriately.
>> +		 */
>> +		if (setting->possible_values) {
>> +			char *tmp =3D setting->possible_values;
>> +
>> +			while ((tmp =3D strchr(tmp, ',')) !=3D NULL)
>> +				*tmp++ =3D ';';
>> +		}
>> +
>>  		kobject_init(&setting->kobj, &tlmi_attr_setting_ktype);
>>  		tlmi_priv.setting[i] =3D setting;
>>  		kfree(item);
>> --=20
>> 2.39.2
>>
