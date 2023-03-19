Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E78AC74A5B
	for <platform-driver-x86@archiver.kernel.org>; Sun, 19 Mar 2023 00:11:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbjCSALJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 18 Mar 2023 20:11:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjCSALI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 18 Mar 2023 20:11:08 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F4E93C26
        for <platform-driver-x86@vger.kernel.org>; Sat, 18 Mar 2023 17:11:06 -0700 (PDT)
Date:   Sun, 19 Mar 2023 00:11:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
        t=1679184664; bh=2ZUwBZ1btQ6YQbH4pKSrtGfRtZ8OumLO9xBg6Uffpwg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XVa4w9umDbkxZRWzPva8QzTJpxGZTkI1KBekoW6Rh7ykBQftcDuZ1lYuDoZ0PPDyp
         gKpoLDG7sBGybZpKbanyabR4glXB+yJ+IfAnOB2REa7xGrqxiqum53tK7qPRGoATQa
         3QcfsQ0NVmx7pP7H/NFicW9cZfMl+tdZ+yTK3dQ0=
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To:     Mark Pearson <mpearson-lenovo@squebb.ca>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        "markgross@kernel.org" <markgross@kernel.org>,
        Mark Pearson <markpearson@lenovo.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH v3 3/3] platform/x86: think-lmi: use correct
 possible_values delimters
Message-ID: <fcf4d321-8756-4d50-85f9-b9278fc1b0e0@t-8ch.de>
References: <mpearson-lenovo@squebb.ca>
 <20230317154635.39692-1-mpearson-lenovo@squebb.ca>
 <20230317154635.39692-3-mpearson-lenovo@squebb.ca>
 <23e08752-777b-4af5-8dbb-c57b1afb822f@t-8ch.de>
 <09591551-c653-41c1-99ce-1108febc51d3@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <09591551-c653-41c1-99ce-1108febc51d3@app.fastmail.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sat, Mar 18, 2023 at 02:06:28PM -0400, Mark Pearson wrote:
> Thanks Thomas,
> 
> On Sat, Mar 18, 2023, at 12:39 PM, Thomas Weißschuh wrote:
> > On Fri, Mar 17, 2023 at 11:46:35AM -0400, Mark Pearson wrote:
> >> firmware-attributes class requires that possible values are delimited
> >> using ';' but the Lenovo firmware uses ',' instead.
> >> Parse string and replace where appropriate
> >> 
> >> Thanks to Thomas W for pointing this out.

This could also be a

Reported-by: Thomas Weißschuh <linux@weissschuh.net>

> >> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> >> ---
> >>  Changes in V3: New patch added to the series. No V1 & V2.
> >> 
> >>  drivers/platform/x86/think-lmi.c | 13 ++++++++++++-
> >>  1 file changed, 12 insertions(+), 1 deletion(-)
> >> 
> >> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
> >> index d89a1c9bdbf1..204f1060a533 100644
> >> --- a/drivers/platform/x86/think-lmi.c
> >> +++ b/drivers/platform/x86/think-lmi.c
> >> @@ -1040,7 +1040,7 @@ static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
> >>  
> >>  	if (setting->possible_values) {
> >>  		/* Figure out what setting type is as BIOS does not return this */
> >> -		if (strchr(setting->possible_values, ','))
> >> +		if (strchr(setting->possible_values, ';'))
> >>  			return sysfs_emit(buf, "enumeration\n");
> >
> > I think this patch should be earlier in the series.
> > So the other patches can work directly from the beginning.
> OK. I was avoiding refactoring everything - my git skills are not great. I'll look at doing that.

I would do it like this with an interactive rebase:

b # apply the generic parts of "platform/x86: think-lmi: use correct possible_values delimters"
pick c2fbd30a7b15 platform/x86: think-lmi: add missing type attribute
pick 644923d17048 platform/x86: think-lmi: Add possible_values for ThinkStation
f a92fa3cda0d6 platform/x86: think-lmi: use correct possible_values delimters

> > Also maybe this needs a Fixes: tag and a Cc: stable@ so it gets
> > backported.

> I wasn't go to label this for stable as it doesn't really have any
> real world impact that I know of. I figure the stable team have better
> things to do then backport minor stuff like this especially with it
> being in a series. If you feel strongly about it I can add it - though
> I'd rather only do it once the review is complete given the requests
> to split patches etc. This series has been way messier then I
> expected.

The -stable process should be automated with the proper stable Cc.

Given that this technically breaks ABI it may better to keep it out of
stable, though.

FYI I looked at the only user of this ABI that I know, fwupd, and it
should gracefully handle this change.
It accepts both ',' and ';' as separator.

> For the Fixes tag - I don't have anything to reference with this apart
> from your email. What would I put in there? If you want to raise a
> bugzilla I'll happy reference that.

The Fixes tag refers to the original commit that introduced the fixed
issue.
In this case it would be the commit adding the think-lmi driver:

Fixes: a40cd7ef22fb ("platform/x86: think-lmi: Add WMI interface support on Lenovo platforms")

Thomas
