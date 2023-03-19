Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71404C74A5B
	for <platform-driver-x86@archiver.kernel.org>; Sun, 19 Mar 2023 00:01:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbjCSABf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 18 Mar 2023 20:01:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjCSABe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 18 Mar 2023 20:01:34 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6FE82412D
        for <platform-driver-x86@vger.kernel.org>; Sat, 18 Mar 2023 17:01:33 -0700 (PDT)
Date:   Sun, 19 Mar 2023 00:01:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
        t=1679184091; bh=uuSGBVzSx0S8LB5PtW8RihMk7Q4BHxAFCo17PQG+mfM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TUJcejAop5klQHlV/a97KuvGKQcFjZ3BhhFUbhI2hQ9dAfIG2VIaqGzH559c+kCE6
         DG6HO+4/aEJizGXOUXv/SQbmlfxZTdhQGOLoAdjHlKWocfR2H5PujPQCQFfe0pJwEt
         yZgOvE4xcPWRePwg906rcCXYwKgUR9v468hWsrjM=
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To:     Mark Pearson <mpearson-lenovo@squebb.ca>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        "markgross@kernel.org" <markgross@kernel.org>,
        Mark Pearson <markpearson@lenovo.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] platform/x86: think-lmi: Add possible_values for
 ThinkStation
Message-ID: <faff3b63-5ccd-4b9d-af7a-68568b6ee934@t-8ch.de>
References: <mpearson-lenovo@squebb.ca>
 <20230317154635.39692-1-mpearson-lenovo@squebb.ca>
 <20230317154635.39692-2-mpearson-lenovo@squebb.ca>
 <c6175d59-2000-4145-95a6-b022631bf3a3@t-8ch.de>
 <7f8a0183-2da6-4ccb-9dd8-3602e67edd5a@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7f8a0183-2da6-4ccb-9dd8-3602e67edd5a@app.fastmail.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sat, Mar 18, 2023 at 01:59:38PM -0400, Mark Pearson wrote:
> On Sat, Mar 18, 2023, at 12:35 PM, Thomas Weißschuh wrote:
> > Hi Mark,
> >
> > please also CC linux-kernel@vger.kernel.org and previous reviewers.
> 
> My apologies on previous reviewers - that was a miss on my behalf
> 
> I've never cc'd linux-kernel previously - is that a requirement? It's
> new to me if it is - what's the reason? (that mailing list seems
> unusable to me from my limited experience...)

The wording in Documentation/process/submitting-patches.rst is indeed
unclear about always Cc'ing linux-kernel.

My arguments for it are:

- People can look at the linux-kernel archives to see what's going on
  all over the kernel.  (I do that sometimes myself)
  Also it makes it easier to search on lore.kernel.org on linux-specific
  messages/patches. The /all/ archives also contains other projects.

- Some bots are processing proposed patches from mailing lists.
  These are not subscribed to all subsystem lists.

- The b4 tool does it.

- Greg does it:
  https://lore.kernel.org/lkml/20230313182918.1312597-5-gregkh@linuxfoundation.org/

Thomas
