From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 1/2] x86/quark: Add Quark embedded SRAM support
Date: Tue, 05 May 2015 15:19:25 -0700
Message-ID: <554941ED.2080004@zytor.com>
References: <1430705875-6990-1-git-send-email-pure.logic@nexus-software.ie> <1430705875-6990-2-git-send-email-pure.logic@nexus-software.ie> <alpine.DEB.2.11.1505041608530.4225@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.11.1505041608530.4225@nanos>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Bryan O'Donoghue <pure.logic@nexus-software.ie>
Cc: mingo@redhat.com, x86@kernel.org, dvhart@infradead.org, andy.schevchenko@gmail.com, boon.leong.ong@intel.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, derek.browne@intel.com, josef.ahmad@intel.com, erik.nyquist@intel.com
List-Id: platform-driver-x86.vger.kernel.org

On 05/04/2015 08:00 AM, Thomas Gleixner wrote:
> 
>> + */
>> +static int esram_dbgfs_state_show(struct seq_file *s, void *unused)
>> +{
>> +	struct esram_dev *edev = &esram_dev;
>> +	u32 data;
>> +	u32 reg = (u32)s->private;
> 
> You really like to waste lines. What's wrong with:
> 
>     	u32 data, reg = .....
> 

I have to say I agree with Bryan here: it is rather ugly to mix
uninitialized and initialized variables on the same declaration line.

	-hpa
