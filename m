Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 855F6C433FE
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Apr 2022 13:26:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350926AbiDZN3G (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Apr 2022 09:29:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351050AbiDZN3F (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Apr 2022 09:29:05 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C42412B27F
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 Apr 2022 06:25:56 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-2ec42eae76bso181855087b3.10
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 Apr 2022 06:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hXo185h+kObSXkmQZMr8a8mrf64dnncRTNIlAM3h4k0=;
        b=XhtPv0riXJD4oHpkFiEGvmxAh+OpkTuZqJNaNstrZ+03xWz4+eDhyxgf4+khWCQbOR
         Q2FF4wcYRcJCHhrpWxTZmaVNfpXgVtNo+IPasqov4enVnqa7Yyul0b+fWNDyrUOCCQNE
         DI+kns+Cp/Gut1CGsEAnh+HysYx0PipRwICaAIjbUW9alp60ozvNXxTOU50PgJI4pvuG
         HwWNpwWhqgpFS8X40+4VFVPQLwJDJR3cAWTLzGtACGPi2Ur6Ui1yH1N4nEPk38pF+ZeH
         DrZA/75cxP0cqsZpfjn/mfb6QxGqr+xYAFUlKLlearwimmc4MJv4zbwK5DkiNDeFYSRp
         xKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hXo185h+kObSXkmQZMr8a8mrf64dnncRTNIlAM3h4k0=;
        b=N/S6R6DoAHI85YdiPch6CklCiOKElRrkz83qb8VJqI5HOt40TVPlejCVFH7/+hEDr0
         7E7za/At9aDxQweJmY5MrmTz5CaWoumgjUjodj5rs+vT+qpyevJ+vMMhvzVUe0dPh07s
         eArp2AqsiQv57DgWQBaYi0O+qOPRQ68Ziiq/dOXOCtm3Xovr11a8choHeW1nY4sAx9CH
         Jdg8NsOBffd0uULaJtMPYk2NXdy1dLpdX+SWbzCMxKmO/1FKqRye1KYVpXvAOFHTO8kX
         mJxtH53pPyQzBjWFPrlO1qja9bZynkepdJpH03pCNub2tYKPU8/VR5S4nVKRZWiR7Kb3
         MK2A==
X-Gm-Message-State: AOAM531h5D0R/kB8kp3Fo7v+C9EAI1M9EzkXzVdKh0NH+qY3KkeEYX1+
        F5S1Y5zMekof4X0p7BPtlQVnjlFvp2vcG/bhKsU7NQ==
X-Google-Smtp-Source: ABdhPJyeUmVpGb8SXBarAcmmHFvinXgebrIrvNFeIufykRJ4H//aeaz5HNCbHAftyJ7CTjQF/0WXHFIa0gYB6LJ9lms=
X-Received: by 2002:a81:7895:0:b0:2f1:6933:3b66 with SMTP id
 t143-20020a817895000000b002f169333b66mr21694519ywc.239.1650979555989; Tue, 26
 Apr 2022 06:25:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220425171526.44925-1-martin.fernandez@eclypsium.com>
 <20220425171526.44925-2-martin.fernandez@eclypsium.com> <YmeM5fklUssR/74e@kernel.org>
 <CAKgze5YwTD3neYjKNZzLz6DLWxpGPohGCDGT6oJn-KUdAxyCfg@mail.gmail.com> <Ymfxt/ccab3DQENo@kernel.org>
In-Reply-To: <Ymfxt/ccab3DQENo@kernel.org>
From:   Daniel Gutson <daniel.gutson@eclypsium.com>
Date:   Tue, 26 Apr 2022 10:25:45 -0300
Message-ID: <CAFmMkTHQ75nJi+Zwi6AEy095qUAhDjdbBqSpvvxq8-B2gD4j-g@mail.gmail.com>
Subject: Re: [PATCH v7 1/8] mm/memblock: Tag memblocks with crypto capabilities
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Martin Fernandez <martin.fernandez@eclypsium.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-mm@kvack.org, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, ardb@kernel.org,
        dvhart@infradead.org, andy@infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rafael@kernel.org, akpm@linux-foundation.org,
        Richard Hughes <hughsient@gmail.com>,
        Alex Bazhaniuk <alex.bazhaniuk@eclypsium.com>,
        Alison Schofield <alison.schofield@intel.com>,
        Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Apr 26, 2022 at 10:21 AM Mike Rapoport <rppt@kernel.org> wrote:
>
> On Tue, Apr 26, 2022 at 09:59:04AM -0300, Martin Fernandez wrote:
> > On 4/26/22, Mike Rapoport <rppt@kernel.org> wrote:
> > > On Mon, Apr 25, 2022 at 02:15:19PM -0300, Martin Fernandez wrote:
> > >> Add the capability to mark regions of the memory memory_type able of
> > >> hardware memory encryption.
> > >>
> > >> Also add the capability to query if all regions of a memory node are
> > >> able to do hardware memory encryption to call it when initializing the
> > >> nodes. Warn the user if a node has both encryptable and
> > >> non-encryptable regions.
> > >>
> > >> Signed-off-by: Martin Fernandez <martin.fernandez@eclypsium.com>
> > >> ---
> > >>  include/linux/memblock.h |  5 ++++
> > >>  mm/memblock.c            | 62 ++++++++++++++++++++++++++++++++++++++++
> > >>  2 files changed, 67 insertions(+)
> > >>
> > >> diff --git a/include/linux/memblock.h b/include/linux/memblock.h
> > >> index 50ad19662a32..00c4f1a20335 100644
> > >> --- a/include/linux/memblock.h
> > >> +++ b/include/linux/memblock.h
> > >> @@ -40,6 +40,7 @@ extern unsigned long long max_possible_pfn;
> > >>   * via a driver, and never indicated in the firmware-provided memory map
> > >> as
> > >>   * system RAM. This corresponds to IORESOURCE_SYSRAM_DRIVER_MANAGED in
> > >> the
> > >>   * kernel resource tree.
> > >> + * @MEMBLOCK_CRYPTO_CAPABLE: capable of hardware encryption
> > >>   */
> > >>  enum memblock_flags {
> > >>    MEMBLOCK_NONE           = 0x0,  /* No special request */
> > >> @@ -47,6 +48,7 @@ enum memblock_flags {
> > >>    MEMBLOCK_MIRROR         = 0x2,  /* mirrored region */
> > >>    MEMBLOCK_NOMAP          = 0x4,  /* don't add to kernel direct mapping */
> > >>    MEMBLOCK_DRIVER_MANAGED = 0x8,  /* always detected via a driver */
> > >> +  MEMBLOCK_CRYPTO_CAPABLE = 0x10, /* capable of hardware encryption */
> > >>  };
> > >>
> > >>  /**
> > >> @@ -120,6 +122,9 @@ int memblock_physmem_add(phys_addr_t base, phys_addr_t
> > >> size);
> > >>  void memblock_trim_memory(phys_addr_t align);
> > >>  bool memblock_overlaps_region(struct memblock_type *type,
> > >>                          phys_addr_t base, phys_addr_t size);
> > >> +bool memblock_node_is_crypto_capable(int nid);
> > >> +int memblock_mark_crypto_capable(phys_addr_t base, phys_addr_t size);
> > >> +int memblock_clear_crypto_capable(phys_addr_t base, phys_addr_t size);
> > >>  int memblock_mark_hotplug(phys_addr_t base, phys_addr_t size);
> > >>  int memblock_clear_hotplug(phys_addr_t base, phys_addr_t size);
> > >>  int memblock_mark_mirror(phys_addr_t base, phys_addr_t size);
> > >> diff --git a/mm/memblock.c b/mm/memblock.c
> > >> index e4f03a6e8e56..fe62f81572e6 100644
> > >> --- a/mm/memblock.c
> > >> +++ b/mm/memblock.c
> > >> @@ -191,6 +191,40 @@ bool __init_memblock memblock_overlaps_region(struct
> > >> memblock_type *type,
> > >>    return i < type->cnt;
> > >>  }
> > >>
> > >> +/**
> > >> + * memblock_node_is_crypto_capable - get if whole node is capable
> > >> + * of encryption
> > >> + * @nid: number of node
> > >> + *
> > >> + * Iterate over all memory memblock_type and find if all regions under
> > >> + * node @nid are capable of hardware encryption.
> > >> + *
> > >> + * Return:
> > >> + * true if every region in memory memblock_type is capable of
> > >
> > > I'd s/in memory memblock_type/in @nid
> > >
> >
> > Good, thanks.
> >
> > >> + * encryption, false otherwise.
> > >> + */
> > >> +bool __init_memblock memblock_node_is_crypto_capable(int nid)
> > >> +{
> > >> +  struct memblock_region *region;
> > >> +  int crypto_capables = 0;
> > >> +  int not_crypto_capables = 0;
> > >> +
> > >> +  for_each_mem_region(region) {
> > >> +          if (memblock_get_region_node(region) == nid) {
> > >> +                  if (region->flags & MEMBLOCK_CRYPTO_CAPABLE)
> > >> +                          crypto_capables++;
> > >> +                  else
> > >> +                          not_crypto_capables++;
> > >> +          }
> > >> +  }
> > >> +
> > >> +  if (crypto_capables > 0 && not_crypto_capables > 0)
> > >> +          pr_warn("Node %d has %d regions that are encryptable and %d regions
> > >> that aren't",
> > >> +                  nid, not_crypto_capables, crypto_capables);
> > >> +
> > >> +  return not_crypto_capables == 0;
> > >
> > > This will return true for memoryless nodes as well. Do you mean to consider
> > > them as capable of encryption?
> > >
> >
> > Not really, I didn't think about that to be honest. I don't think it's
> > a good idea to consider them as capable, right?
>
> I think capable of encryption would mean
>
>         crypto_capables && !not_crypto_capables

Since these operands were evaluated above with comparison ops, I would say
    crypto_capables > 0 && not_crypto_capables == 0
to improve readability and be explicit that they are numbers rather
than booleans.


>
> --
> Sincerely yours,
> Mike.
