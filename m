Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96FD9C43334
	for <platform-driver-x86@archiver.kernel.org>; Thu,  9 Jun 2022 10:50:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234990AbiFIKuQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 9 Jun 2022 06:50:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbiFIKuQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Jun 2022 06:50:16 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F28731402C
        for <platform-driver-x86@vger.kernel.org>; Thu,  9 Jun 2022 03:50:14 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id v1so35969870ejg.13
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Jun 2022 03:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9dwRSDPiiVchQ5h8NFX0vShyIUhKFm7Iqk6kI0Iyi7s=;
        b=TUWKjyAVvvw0O4C0dEQIAZhzTYyUeJwJNGaHOMt3Vt20KX4DpU9x0c61buXHanHSDQ
         GI13i/jWWGcsub8OauIbgDaoahKTCOwWI4PMA3m9ULT95HIfcD065LSyD8RSm8l2T5/r
         cJwQvh9mkq+jilrS+dpFcg2RG54W5pf3x+42lUzeNBGvDncEsq/TItwIjFSN1yOmPBBT
         eo++KaEhrWqfRLa+djCzFfGq+mikxjpNefQDPRK1suWRO/M0XuVFUZEMBAgdYbKAEpe1
         N2ssJ+reAcnJLlVAHIeTz/8QerAZngHKS9Y8qH+U573hLnNTGfOoAOxrkM7KG6/BqF7V
         93MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9dwRSDPiiVchQ5h8NFX0vShyIUhKFm7Iqk6kI0Iyi7s=;
        b=uTgqmX1jQUWNyRm0lISYU7gKUBEi2ZVFFPFsr1a/7amEKTs8NFMUx6on/nlMdnJNO+
         idq3/DLWLAe8GTvtGcfnDnfFI4Zsbr1yg4ghEHIjVu2pLEIXH6zHkq8yZCs4cpmTqBLS
         4gOvu7UoKLSs7UqKzBB3mKWZ3RfOdDLG4o8a4Bmz70w4mgJtnl8WX2o21kMV7DIMAyJ0
         1NZbeKrPaji36S/CTgzeCFy8o0Ae9YCMkDrSloVfiwOtynbS913MyKfUdaejfgu+aRZ8
         SqzB9C8TkAxkPJS/uz2VsOUDoXZCSswtsgtyxYcM3RX+MHDraxPrZTavCa0L9WcMCgC8
         Ffug==
X-Gm-Message-State: AOAM532ndIb43ZaS/OLtFxtqprdrP90GLfvz9EXxDZhDS4gnB4A2o1v9
        2ubsas75kb+cgnV/JHkzDS3a9ULGGP8oLlm/E9teIRNMZ10=
X-Google-Smtp-Source: ABdhPJxUPtpuO4t/YU33ehW2gqKF50cuoCamMMthPM5uMTToRWiOnk+Htp/YARGnGg/wasELM9G6dNYxqrvWELBqghI=
X-Received: by 2002:a17:907:9721:b0:70c:65e7:2aa5 with SMTP id
 jg33-20020a170907972100b0070c65e72aa5mr32068606ejc.132.1654771813393; Thu, 09
 Jun 2022 03:50:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220608170220.5751-1-jorge.lopez2@hp.com> <20220608170220.5751-2-jorge.lopez2@hp.com>
 <CAHp75VdPOSHyHiwFWYR6_BuoUXca9wvYFkgy7wXBW305FGHigA@mail.gmail.com> <CAOOmCE-NSei2+Y=NFjjF9jmY0L8HtOO4jHSnfm=kC7dTOZjwpg@mail.gmail.com>
In-Reply-To: <CAOOmCE-NSei2+Y=NFjjF9jmY0L8HtOO4jHSnfm=kC7dTOZjwpg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 9 Jun 2022 12:49:37 +0200
Message-ID: <CAHp75VeC89LEE0AnOfAKXXmrATOaNGu6RmXztaYGkXDbabokxw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] Resolve WMI query failures on some devices
To:     Jorge Lopez <jorgealtxwork@gmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Jun 8, 2022 at 11:04 PM Jorge Lopez <jorgealtxwork@gmail.com> wrote:
>
> Hi Andy,
>
> Failure to run your tool and include all the appropriate parties in
> the review was an oversight on my part.  I will make sure it is done
> in the following patches.

Hmm... It uses get_maintainer.pl which I believe uses the MAINTAINERS
database more or less correctly. I use the script on a daily basis.

> Regarding the statement  ...
>
>       Please, be careful and read all comments you have been given and react
>       to them either by explaining why it's not worth to address or with an
>       addressed changes.
>
> All other comments have been addressed in the commit notes and via
> email.

I have noticed that by reading the next patch. As I mentioned there,
it should be squashed to the first one, I never expected to see two
patches on this topic.

>   The comments addressed were
>
> - As a quick fix it's good, but have you had a chance to understand why
> this failure happened in the first place?
>
> - Can you check my theory that is expressed in the code below?
> - Leverage ge2maintainer tool to include all appropriate parties.
> (See earlier comment)
>
> Did I address all the comments?  If not, please accept my apologies
> and kindly point to the question(s) I need to address.



-- 
With Best Regards,
Andy Shevchenko
