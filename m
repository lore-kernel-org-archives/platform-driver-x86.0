Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAE9CC77B72
	for <platform-driver-x86@archiver.kernel.org>; Fri, 14 Apr 2023 15:19:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbjDNPT4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 14 Apr 2023 11:19:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231354AbjDNPTz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 14 Apr 2023 11:19:55 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 179335FDE
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Apr 2023 08:19:53 -0700 (PDT)
Date:   Fri, 14 Apr 2023 17:19:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
        t=1681485590; bh=/mYLDVppa+VQ1uhEklxE9lqSB8zRTjh6fE+WRhLBo38=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Rjkc3N1Y6f2KslT98tnXVxxnanVb2Fhsj7OjuSptl164vXGT7BE46KwYDKbxaW7Sy
         phhnhtZFsLpnZR6+29qAUrS++9NJ3MidtJd1Ez7xh5n1OdtJP662ULvMvuRRXKHZJ2
         HVoF8AHLnWY82uRrLk+adZlUvJ00Jkd0crI3MMtc=
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To:     Jorge Lopez <jorgealtxwork@gmail.com>
Cc:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v6 1/4] Introduction of HP-BIOSCFG driver
Message-ID: <f87fb773-1dd0-47fb-aa86-e0d4cd0d274d@t-8ch.de>
References: <20230309201022.9502-1-jorge.lopez2@hp.com>
 <20230309201022.9502-2-jorge.lopez2@hp.com>
 <dbf97220-03d6-4815-8f14-55ee477b8afb@t-8ch.de>
 <CAOOmCE-=cprrpzEz5EOs00K7B=bp1rnrnZY7Ee0a245piioiJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOOmCE-=cprrpzEz5EOs00K7B=bp1rnrnZY7Ee0a245piioiJQ@mail.gmail.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Jorge,

On 2023-04-12 14:37:45-0500, Jorge Lopez wrote:
> On Sun, Apr 2, 2023 at 11:28 AM Thomas Weißschuh <thomas@t-8ch.de> wrote:
> > Instead of passing around integer ids, that all the callees are using to
> > look up some global data, it would be nicer to pass a pointer to the
> > concrete instance struct to work on.
> >
> 
> validate_string_input is part of the defined function
> ATTRIBUTE_PROPERTY_STORE in bioscfg.h (line 457).
> 
> > This makes the code simpler and removes reference to global state all
> > over the place.
> >
> Changing the values from int to pointer will add unnecessary overhead
> since the instance ID is searched only once earlier in the process.

Is this overhead measurable? If it can't be measured and/or does not
make a difference, code clarity should always trump performance.

On the other hand if you think the current way is clearer just keep it
as is.

Thomas
