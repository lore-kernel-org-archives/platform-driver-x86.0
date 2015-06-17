From: Michal Hocko <mhocko@suse.cz>
Subject: Re: Possible broken MM code in dell-laptop.c?
Date: Wed, 17 Jun 2015 09:19:39 +0200
Message-ID: <20150617071939.GA25056@dhcp22.suse.cz>
References: <201506141105.07171@pali>
 <20150615211816.GC16138@dhcp22.suse.cz>
 <201506152327.59907@pali>
 <20150616063346.GA24296@dhcp22.suse.cz>
 <20150616071523.GB5863@pali>
 <20150617034334.GB29788@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150617034334.GB29788@vmdeb7>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, Stuart Hayes <stuart_hayes@dell.com>, Matthew Garrett <mjg@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, platform-driver-x86@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue 16-06-15 20:43:34, Darren Hart wrote:
[...]
> Michal - thanks for the context.
> 
> I'm surprised by your recommendation to use __free_page() out here in platform
> driver land.
> 
> I'd also prefer that the driver consistently free the same address to avoid
> confusion.
> 
> For these reasons, free_page((unsigned long)buffer) seems like the better
> option.
> 
> Can you elaborate on why you feel __free_page() is a better choice?

Well the allocation uses alloc_page and __free_page is the freeing
counterpart so it is natural to use it if the allocated page is
available. Which is the case here.

Anyway the code can be cleaned up by using __get_free_page for the
allocation, then you do not have to care about the struct page and get
the address right away without an additional code. free_page would be a
natural freeing path.
__get_free_page would be even a better API because it enforces that
the allocation is not from the highmem - which the driver already does
by not using __GFP_HIGHMEM.

-- 
Michal Hocko
SUSE Labs
