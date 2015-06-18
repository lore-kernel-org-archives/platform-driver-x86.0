From: Darren Hart <dvhart@infradead.org>
Subject: Re: Possible broken MM code in dell-laptop.c?
Date: Thu, 18 Jun 2015 14:14:46 -0700
Message-ID: <20150618211446.GB70097@vmdeb7>
References: <201506141105.07171@pali>
 <20150615211816.GC16138@dhcp22.suse.cz>
 <201506152327.59907@pali>
 <20150616063346.GA24296@dhcp22.suse.cz>
 <20150616071523.GB5863@pali>
 <20150617034334.GB29788@vmdeb7>
 <20150617071939.GA25056@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
In-Reply-To: <20150617071939.GA25056@dhcp22.suse.cz>
Sender: owner-linux-mm@kvack.org
To: Michal Hocko <mhocko@suse.cz>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, Stuart Hayes <stuart_hayes@dell.com>, Matthew Garrett <mjg@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, platform-driver-x86@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jun 17, 2015 at 09:19:39AM +0200, Michal Hocko wrote:
> On Tue 16-06-15 20:43:34, Darren Hart wrote:
> [...]
> > Michal - thanks for the context.
> > 
> > I'm surprised by your recommendation to use __free_page() out here in platform
> > driver land.
> > 
> > I'd also prefer that the driver consistently free the same address to avoid
> > confusion.
> > 
> > For these reasons, free_page((unsigned long)buffer) seems like the better
> > option.
> > 
> > Can you elaborate on why you feel __free_page() is a better choice?
> 
> Well the allocation uses alloc_page and __free_page is the freeing
> counterpart so it is natural to use it if the allocated page is
> available. Which is the case here.
> 
> Anyway the code can be cleaned up by using __get_free_page for the
> allocation, then you do not have to care about the struct page and get
> the address right away without an additional code. free_page would be a
> natural freeing path.
> __get_free_page would be even a better API because it enforces that
> the allocation is not from the highmem - which the driver already does
> by not using __GFP_HIGHMEM.
> 

Thank you Michal, I guess I'm just tripping over an API with mismatched __ and
no __ prefix paired calls. Thanks for the clarification.

Pali, I'm fine with any of these options - it sounds as though __get_free_page()
may be a general improvement.

-- 
Darren Hart
Intel Open Source Technology Center

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
