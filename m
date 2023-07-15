Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83D38C0015E
	for <platform-driver-x86@archiver.kernel.org>; Sat, 15 Jul 2023 17:40:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbjGORki (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 15 Jul 2023 13:40:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbjGORki (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 15 Jul 2023 13:40:38 -0400
Received: from smtp-out.abv.bg (smtp-out.abv.bg [194.153.145.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C069D1B3
        for <platform-driver-x86@vger.kernel.org>; Sat, 15 Jul 2023 10:40:33 -0700 (PDT)
Received: from nm81.abv.bg (nm81.ni.bg [192.168.151.111])
        by smtp-out.abv.bg (Postfix) with UTF8SMTP id 0DD743396;
        Sat, 15 Jul 2023 20:40:29 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=abv.bg; s=smtp-out;
        t=1689442829; bh=/W8wdkonqy9CnSs1AukiV1ZHbieNr1HorXno2GEQN7M=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=v/a7vJewtOV9NDJ6y5kGgIxQ26bAmPpb3rZLW5j76v9jy0WAgZ7Z4O1XHU3BWVUKR
         AcTOMFHwxiP6XeTRrYIDNd6N9ZmBpIbrcBJWN7SkTzS7g0c5mpfY5yF1+Mc5DL20D3
         D8bnZ2dRNSAtDwobeGup2APXQcqrreNgjTEiGFPw=
Received: from nm81.abv.bg (localhost [127.0.0.1])
        by nm81.abv.bg (Postfix) with UTF8SMTP id EE1539D7E8;
        Sat, 15 Jul 2023 20:40:28 +0300 (EEST)
Date:   Sat, 15 Jul 2023 20:40:28 +0300 (EEST)
From:   Kristian Angelov <kristiana2000@abv.bg>
To:     Luke Jones <luke@ljones.dev>
Cc:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Message-ID: <826952617.2041770.1689442828976@nm81.abv.bg>
In-Reply-To: <5bc0abe6f218bf7ae59dc20de099e3609e077a36.camel@ljones.dev>
References: <ZLGzxoJN_7Dhl_si@wyvern.localdomain>
         <7ae06b8a-6c67-f6a6-06ed-2b6c8430c12c@redhat.com>
         <1549bab6dae1e4509f7190469c0d2371f127a4f0.camel@ljones.dev>
         <87d34e1d-1fcb-6d24-662f-91ff62f65dc2@redhat.com> <5bc0abe6f218bf7ae59dc20de099e3609e077a36.camel@ljones.dev>
Subject: Re: [PATCH v2] platform/x86: asus-wmi: Fix setting RGB mode on some TUF laptops
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Mailer: AbvMail 3.0
X-Originating-IP: 84.238.195.102
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 15/07/23 09:40, Hans de Goede wrote:
> Hi Kristian,
> 
> On 7/14/23 22:44, Kristian Angelov wrote:
> > This patch fixes setting the cmd values to 0xb3 and 0xb4.
> > This is necessary on some TUF laptops in order to set the RGB mode.
> > 
> > Closes: https://lore.kernel.org/platform-driver-x86/443078148.491022.1677576298133@nm83.abv.bg
> > Signed-off-by: Kristian Angelov <kristiana2000@abv.bg>
> > ---
> >  V1 -> V2. Make setting 0xb3 and 0xb4 the default logic
> >  
> >  drivers/platform/x86/asus-wmi.c | 13 +++++++++++--
> >  1 file changed, 11 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> > index 1038dfdcdd32..eb82ed723b42 100644
> > --- a/drivers/platform/x86/asus-wmi.c
> > +++ b/drivers/platform/x86/asus-wmi.c
> > @@ -738,13 +738,22 @@ static ssize_t kbd_rgb_mode_store(struct device *dev,
> >  				 struct device_attribute *attr,
> >  				 const char *buf, size_t count)
> >  {
> > -	u32 cmd, mode, r, g,  b,  speed;
> > +	u32 cmd, mode, r, g, b, speed;
> >  	int err;
> >  
> >  	if (sscanf(buf, "%d %d %d %d %d %d", &cmd, &mode, &r, &g, &b, &speed) != 6)
> >  		return -EINVAL;
> >  
> > -	cmd = !!cmd;
> > +	/* B3 is set and B4 is save to BIOS. Only set by default*/
> > +	switch (cmd) {
> > +	default:
> > +	case 0:
> > +		cmd = 0xb3;
> > +		break;
> > +	case 1:
> > +		cmd = 0xb4;
> > +		break;
> > +	}
> 
> You are now leaving the value of cmd unmodified for values which are not 0 and 1.
> 
> I think you need to add a:
> 
> 	default:
> 		return -EINVAL;
> 
> here to catch cmd not being either 0 or 1.
> 
> Luke, what do you think ?
> 
> Regards,
> 
> Hans


Hi Hans,


If you would notice I did:
>	switch (cmd) {
>	default:
>	case 0:
>		cmd = 0xb3;
>		break;


In the case of cmd not being 1 or 0. It would default to 0 which would only set
the RGB mode, not save it to BIOS. I guess this would depend on preference.
Is it better to fail out on invalid input or simply ignore it and perform the
"default" action. Setting the RGB mode is not persistent, only saving it is. So
defaulting to this seems reasonable, but if not I'll do a v3 with EINVAL fail.


Best regards,


Kristian
