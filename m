Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26E17C05027
	for <platform-driver-x86@archiver.kernel.org>; Tue, 14 Mar 2023 20:14:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbjCNUOp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 14 Mar 2023 16:14:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbjCNUOo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Mar 2023 16:14:44 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C370192
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Mar 2023 13:14:43 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 3DA0C3200B78;
        Tue, 14 Mar 2023 16:14:42 -0400 (EDT)
Received: from imap52 ([10.202.2.102])
  by compute5.internal (MEProxy); Tue, 14 Mar 2023 16:14:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
        1678824881; x=1678911281; bh=H9L6vO+0Ub0oeHVQXph30mgnW0efTO5diWK
        RKZlQ2pA=; b=XXEVOyCFMEehfg8lL1QxeEQHWKzP+yur6AbHK0Hh8qQ6uzYjNHg
        YYWgaxRhW+serKVkD9eyxiEvsNdmhfYRWvu25QNidu52709yaboQbxr0pHBV4Zpv
        DyGdvlndoVIYkTtTdKVhAXBeNErZlqs0HsiBk2cbjuQifpV6WuWVN+ERNIXK/ZrD
        vv/xzosJNfACPtHpCZaccp893qYBfYD2QA8sfXWQ+zI5GI12LX/m8RTgR1zNSMRx
        B8+bGVJ51g+69InvFxyoRUE6VDLnr/wExMbjau+tNXP+Sg1Ql2OmLCfboyA+bHtA
        Y1M18F1/wf/+zWRu7cUraf2jH6d9cE5mXmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1678824881; x=1678911281; bh=H9L6vO+0Ub0oeHVQXph30mgnW0efTO5diWK
        RKZlQ2pA=; b=B6XONgiSmx7FGulOwpljKexq6aXMqNed5lJ8Ta9hHPZAut1iltD
        2eSVVyCKzProtjvidDF3CJ909Xf7RYzL/U249J1y+1aYUzvc2cRz6uCAdjVdG2Tl
        XQYW8yhpt2eOj6kFUogSry7/Smo0Rmslcnvs1YKlrxd+e+oVKJl0QuNci6AA8O80
        BlggfencJlGlkqnTyocTQWHEe2rwv0LaImYLlE+P2XO9n016+QSOLuz474IBvReB
        /aAx0LlfpD5kGG0dd7Yis1wATLfh2AIwRQAcZ1WbFN0CWVD8G8L1LW3nyX1287PC
        fyhNRtBFERNRbI3Z5chr1LY3RlDhvTeJ0+w==
X-ME-Sender: <xms:sdUQZLNVJd-o8Jb8YB1bE3UBXA5WuVBNZX9DOx29DYhlm1LUXbFs3A>
    <xme:sdUQZF9r3hAaGWI4_mqFmcOQ0q4LtAnc2e8DglBBUT-N3xhBiDPiVf085ZpzOz4Wd
    FzohD901THHMn7vpUc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddviedgudefkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    ofgrrhhkucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvg
    gssgdrtggrqeenucggtffrrghtthgvrhhnpefhfeegudeftefgteelgfekgfdvjeelleev
    gffhjeffhfdtiedtjeefkedvuefgkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdr
    tggr
X-ME-Proxy: <xmx:sdUQZKRpH1hpA22mBSk294Yda5NYNdgg45YYDIUkmKoKMVH7qEA3Iw>
    <xmx:sdUQZPu-XJ7s6IkzoE84XWLbtLrlsstUECK4QZ46AvsmOPOwBk0tNQ>
    <xmx:sdUQZDeXurbwjInktRyzCyfCSwmnvi-tIofaZvhM33FC6-pXQ1jkeQ>
    <xmx:sdUQZEq0tjJ91Abc9c2nZMSNgBsBOZqM67weA7kzuvvycVP3zhirag>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id F2EE3C60091; Tue, 14 Mar 2023 16:14:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-221-gec32977366-fm-20230306.001-gec329773
Mime-Version: 1.0
Message-Id: <8db2b810-a4f2-4da9-85b8-9da95f4501a6@app.fastmail.com>
In-Reply-To: <9b2cbb46-6438-462d-b98f-82edfc34df64@t-8ch.de>
References: <mpearson-lenovo@squebb.ca>
 <20230313184541.193733-1-mpearson-lenovo@squebb.ca>
 <20230313184541.193733-2-mpearson-lenovo@squebb.ca>
 <9b2cbb46-6438-462d-b98f-82edfc34df64@t-8ch.de>
Date:   Tue, 14 Mar 2023 16:14:20 -0400
From:   "Mark Pearson" <mpearson-lenovo@squebb.ca>
To:     =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc:     "Hans de Goede" <hdegoede@redhat.com>,
        "markgross@kernel.org" <markgross@kernel.org>,
        "Mark Pearson" <markpearson@lenovo.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] platform/x86: think-lmi: Add possible_values for
 ThinkStation
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Thomas,

On Mon, Mar 13, 2023, at 7:58 PM, Thomas Wei=C3=9Fschuh wrote:
> Hi Mark,
>
> some more remarks, sorry not seeing this earlier.

No worries :) I appreciate the reviews.

>
> On Mon, Mar 13, 2023 at 02:45:41PM -0400, Mark Pearson wrote:
>> ThinkStation platforms don't support the API to return possible_values
>> but instead embed it in the settings string.
>>=20
>> Try and extract this information and set the possible_values attribute
>> appropriately.
>>=20
>> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>> ---
>> Changes in V2:
>>  - Move no value for possible_values handling into show function
>>  - use kstrndup for allocating string
>>=20
>>  drivers/platform/x86/think-lmi.c | 26 ++++++++++++++++++++++----
>>  1 file changed, 22 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/=
think-lmi.c
>> index 5fa5451c4802..7dd8f72176f5 100644
>> --- a/drivers/platform/x86/think-lmi.c
>> +++ b/drivers/platform/x86/think-lmi.c
>> @@ -941,10 +941,9 @@ static ssize_t possible_values_show(struct kobje=
ct *kobj, struct kobj_attribute
>>  {
>>  	struct tlmi_attr_setting *setting =3D to_tlmi_attr_setting(kobj);
>> =20
>> -	if (!tlmi_priv.can_get_bios_selections)
>> -		return -EOPNOTSUPP;
>> -
>> -	return sysfs_emit(buf, "%s\n", setting->possible_values);
>> +	if (setting->possible_values)
>> +		return sysfs_emit(buf, "%s\n", setting->possible_values);
>> +	return sysfs_emit(buf, "not available\n");
>>  }
>
> As the attribute "possible_values" is not mandatory it should be
> possible to hide it completely with an is_visible callback.
>
> This would indicate absence clearer than a magic value.

Agreed - I like it. I'll look into implementing that. Thank you.

>
>>  static ssize_t type_show(struct kobject *kobj, struct kobj_attribute=
 *attr,
>> @@ -1440,6 +1439,25 @@ static int tlmi_analyze(void)
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
>
> The values in possible_values are supposed to be separated by
> semi-colons, not commas.
> I don't know how this affects the existing parts of this driver but it
> affects both patches of this series.

Good point, and I'd missed that.
The current string is returned directly from the BIOS, so I'll have to m=
anipulate it. I would ask the BIOS team to change it but it will take fo=
rever and could impact Windows - so better to tweak it in the driver.
I'll do this as a third patch I think.

Thanks
Mark
