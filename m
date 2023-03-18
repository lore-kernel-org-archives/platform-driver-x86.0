Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE45CC74A5B
	for <platform-driver-x86@archiver.kernel.org>; Sat, 18 Mar 2023 23:52:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbjCRXwW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 18 Mar 2023 19:52:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbjCRXwW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 18 Mar 2023 19:52:22 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C275920575
        for <platform-driver-x86@vger.kernel.org>; Sat, 18 Mar 2023 16:52:19 -0700 (PDT)
Date:   Sat, 18 Mar 2023 23:52:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
        t=1679183537; bh=1IfXrW8Lv6FvA9rN1n0BvD6fAFuTRhY5+Fq/dwCvpn8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UVudeaYg7CJtN/lMre2BdH1rAoRLtGrQ4bZYbJBBykYMZdHPFJnXQVIISgf7ebBK8
         F+xjWaIlLJiILs5hbsIuITuaKEIn3ihldFxZV+fsNCIEi7bKFDQLfrXNRePXwBAu6R
         osbNLJWiok74xkSp79Y/+7MLEEvS3/vARz8r5wlQ=
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To:     Mark Pearson <mpearson-lenovo@squebb.ca>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        "markgross@kernel.org" <markgross@kernel.org>,
        Mark Pearson <markpearson@lenovo.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] platform/x86: think-lmi: Add possible_values for
 ThinkStation
Message-ID: <e56512fa-b738-44f5-9dc4-57d46c994afd@t-8ch.de>
References: <mpearson-lenovo@squebb.ca>
 <20230317154635.39692-1-mpearson-lenovo@squebb.ca>
 <20230317154635.39692-2-mpearson-lenovo@squebb.ca>
 <c6175d59-2000-4145-95a6-b022631bf3a3@t-8ch.de>
 <da0c88a5-d03f-4dc2-939d-f1e60bc7d3cc@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <da0c88a5-d03f-4dc2-939d-f1e60bc7d3cc@app.fastmail.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sat, Mar 18, 2023 at 01:53:33PM -0400, Mark Pearson wrote:
> Thanks Thomas
> 
> On Sat, Mar 18, 2023, at 12:35 PM, Thomas Weißschuh wrote:
> > Hi Mark,
> >
> > please also CC linux-kernel@vger.kernel.org and previous reviewers.
> >
> > On Fri, Mar 17, 2023 at 11:46:34AM -0400, Mark Pearson wrote:
> >> -static struct kobj_attribute attr_current_val = __ATTR_RW_MODE(current_value, 0600);
> >> +static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
> >> +		char *buf)
> >> +{
> >> +	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
> >> +
> >> +	if (setting->possible_values) {
> >> +		/* Figure out what setting type is as BIOS does not return this */
> >> +		if (strchr(setting->possible_values, ','))
> >> +			return sysfs_emit(buf, "enumeration\n");
> >> +	}
> >> +	/* Anything else is going to be a string */
> >> +	return sysfs_emit(buf, "string\n");
> >> +}
> >
> > This patch seems to introduce a lot of churn, is it intentional?
> Yes(ish). It got cleaned up as the functions were in a weird order when I introduced the is_visible. The actual changes are very small - but it did make it look messier than it really is.
> Is this a big concern? I know it makes the review a bit more painful and my apologies for that.

Not a big concern. The shuffling around could be done in a dedicated
patch that explicitly only moves code around.

> >> @@ -1440,6 +1451,25 @@ static int tlmi_analyze(void)
> >>  			if (ret || !setting->possible_values)
> >>  				pr_info("Error retrieving possible values for %d : %s\n",
> >>  						i, setting->display_name);
> >> +		} else {
> >> +			/*
> >> +			 * Older Thinkstations don't support the bios_selections API.
> >> +			 * Instead they store this as a [Optional:Option1,Option2] section of the
> >> +			 * name string.
> >> +			 * Try and pull that out if it's available.
> >> +			 */
> >> +			char *item, *optstart, *optend;
> >> +
> >> +			if (!tlmi_setting(setting->index, &item, LENOVO_BIOS_SETTING_GUID)) {
> >> +				optstart = strstr(item, "[Optional:");
> >> +				if (optstart) {
> >> +					optstart += strlen("[Optional:");
> >> +					optend = strstr(optstart, "]");
> >> +					if (optend)
> >> +						setting->possible_values =
> >> +							kstrndup(optstart, optend - optstart, GFP_KERNEL);
> >> +				}
> >> +			}
> >
> > The patch now does two things:
> > 1) Hide the sysfs attributes if the value is not available
> > 2) Extract the value from the description
> >
> > Maybe it could be split in two?
> Sure. I did contemplate that and then ultimately decided it was all from the same intent so left it. But I can split.

Would look nicer to me, but it's only one opinion.

> >
> > Another observation:
> > Would it make sense to remove the part
> > "[Optional:Option1,Option2]" from the name attribute?
> >
> I considered this previously and I was concerned about if this could
> have impacts that I couldn't foresee. The BIOS teams do strange things
> with this string so I was playing safe and leaving it alone
> (especially as it differs across the different portfolios)
> 
> I know it would be nice to have one standard for everything but sadly that's not the case, and not a battle I can win.

Fair enough.
