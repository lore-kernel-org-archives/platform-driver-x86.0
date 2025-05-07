Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461908C1E
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 May 2025 01:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746582106; cv=none; b=MiR0lPYgbshHxod+wqbUsaKd5UVZu2SBtqEfa1Y2MQLf3xtfxPdqpjDIKSBW6uB3XpKotTXZSNjRSG+33NKcrNMXZkChdbkkEEfzKTOQRuOXfT76mv52TYf7aZhznB0J9/WWeVpa9QNC5hxqOkc9g+SqXqNDS6M8G8wymSye4U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746582106; c=relaxed/simple;
	bh=9ityg9GGQPQ59OuDk4YgW6K9gKObBHsjxBg0Jv7ROeI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R0Z0Rxsy2mxkO9Rdo5j4yJCkc7xUGbjlbMHjFciYrwXQoHjHNbwjh92fVsG08S+oso/AMsAiQtxcCwVRdmPHHN/9Dh0CroZX/I8ILkEADL5HCfDz7m/uFIEuXRob7bRIMBecKAHagkT0aoa7JJ3j3q0c7qUsorxkunAagzQvZv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pR+DDvHq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pR+DDvHq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73028C4CEE4;
	Wed,  7 May 2025 01:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746582106;
	bh=9ityg9GGQPQ59OuDk4YgW6K9gKObBHsjxBg0Jv7ROeI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pR+DDvHqHTAnvFj2OItmJi7AihRpCBVpQ9e+K3PXggPK+HuN1bjhSE3L7SOTpnQtG
	 27fpa8YRcjGS5zadSurOIOShFQ41Dw+DXH5lGFGuBr93WT9cLNQkhe9LIq13wm10x0
	 HDsY4gft1WeCLb6cOkzCV4dAaa/PkyQqyxIfrN9BAGkDySjDxs9l+PiJz7MI8TNu9Z
	 ymAVJuQ1KHCWrerIlAwwtToxho+b0EFD76YW2rKWNwCpRongud+m/iobRLc5hgKHXC
	 qYPtkt50lnL51QpSC3H6MEqBPZxDBNxdpbbYlyK75BIuiJxfiySCEnX0D0c9X2CoLN
	 4+rkXnniAsCIw==
Message-ID: <f3a52690-2a27-4c27-a5dd-460a244491ef@kernel.org>
Date: Tue, 6 May 2025 20:41:43 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers/platform/x86/amd: pmf: Fix a double free on
 module unload
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Shyam-sundar.S-k@amd.com, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org
References: <20250506131130.1446262-1-superm1@kernel.org>
 <aBowhD4lwc017-NE@stanley.mountain>
 <fce0ca00-3d0b-48a8-ad97-9125f4297f05@kernel.org>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <fce0ca00-3d0b-48a8-ad97-9125f4297f05@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/6/2025 11:11 AM, Mario Limonciello wrote:
> On 5/6/2025 10:53 AM, Dan Carpenter wrote:
>> On Tue, May 06, 2025 at 08:11:29AM -0500, Mario Limonciello wrote:
>>> From: Mario Limonciello <mario.limonciello@amd.com>
>>>
>>> If setting up smart PC fails for any reason then this can lead to
>>> a double free when unloading amd-pmf.  This is because dev->buf was
>>> freed but never set to NULL and is again freed in
>>> amd_pmf_deinit_smart_pc().
>>>
>>> Explicitly set pointers to NULL after freeing them to avoid the
>>> double free.
>>>
>>> Fixes: 5b1122fc4995f ("platform/x86/amd/pmf: fix cleanup in 
>>> amd_pmf_init_smart_pc()")
>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>> ---
>>>   drivers/platform/x86/amd/pmf/tee-if.c | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/ 
>>> platform/x86/amd/pmf/tee-if.c
>>> index a1e43873a07b0..48902f1c767c6 100644
>>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>>> @@ -579,10 +579,13 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>>>       amd_pmf_tee_deinit(dev);
>>          ^^^^^^^^^^^^^^^^^^^^^^^
>>
>>>   err_free_prev_data:
>>>       kfree(dev->prev_data);
>>> +    dev->prev_data = NULL;
>>>   err_free_policy:
>>>       kfree(dev->policy_buf);
>>> +    dev->policy_buf = NULL;
>>>   err_free_dram_buf:
>>>       kfree(dev->buf);
>>> +    dev->buf = NULL;
>>>   err_cancel_work:
>>>       cancel_delayed_work_sync(&dev->pb_work);
>>
>> This is a real bug.  Did you find it from testing or reading the code?
> 
> I found it from testing.  I was testing some other unrelated changes and 
> found that unloading/reloading the module eventually lead to problems. I 
> tracked it down to your change.
> 
>> My reading of the code says that this bug can only occur if
>> amd_pmf_register_input_device() fails, right?
> 
> No; it was happening from a failure where the system didn't have a 
> policy or had a "bad" policy.
> 
>>
>> We can only call amd_pmf_deinit_smart_pc() if 
>> amd_pmf_start_policy_engine()
>> succeeds because that's where we set:
>>
>>     dev->smart_pc_enabled = true;
>>
>> This patch doesn't totally fix the problem because we would still call
>> amd_pmf_tee_deinit().  That's why I suspect you found this by auditing
>> the code because I think that remaining bug would trigger a stack trace.
>> I also worry that there is a small race window where we could trigger
>> amd_pmf_tee_deinit() before amd_pmf_init_smart_pc() has finished
>> running.
>>
>> Another bug is that we should cancel the work before freeing all the
>> pointers.  This looks like the more serious bug.
>>
>> What about if we only set dev->smart_pc_enabled = true if the whole
>> amd_pmf_init_smart_pc() has succeeded?
>>
>> regards,
>> dan carpenter
>>
> 
> Right; it's only set when amd_pmf_start_policy_engine() succeeds which 
> was not the case for me.  This makes me wonder how exactly this was 
> happening [amd_pmf_deinit_smart_pc() would only be called from 
> amd_pmf_deinit_features()].

For completeness; here is the trace back after load/unload which was 
fixed by this patch I shared (passed through scripts/decode_stacktrace.sh)

[   33.636532] ------------[ cut here ]------------ 
  
  
                                                                [ 
33.636540] kernel BUG at mm/slub.c:546! 
  
  
                                                            [ 
33.636554] Oops: invalid opcode: 0000 [#1] SMP NOPTI 
  
  
                                                            [ 
33.636560] CPU: 4 UID: 0 PID: 3245 Comm: rmmod Not tainted 
6.15.0-rc1-00020-g0581d384f344 #79 PREEMPT(full) 
4b12a0d175d8a11a0952957398aaf7c2efd0bbd7 
  
                       [   33.636565] Hardware name: Framework Laptop 13 
(AMD Ryzen AI 300 Series)/FRANMGCP09, BIOS 03.03 03/10/2025 
  
  
              [   33.636567] RIP: 0010:__slab_free (mm/slub.c:546 
(discriminator 1) mm/slub.c:4475 (discriminator 1)) 
  
  
            [ 33.636578] Code: 0c 44 0f b6 4c 24 13 44 8b 44 24 14 48 89 
44 24 20 49 8b 04 24 4c 8b 54 24 18 48 c1 e8 09 83 e0 01 88 44 24 11 e9 
ce fe ff ff <0f> 0b 41 f7 46 08 87 04 00 00 75 91 eb 83 41 f7 46 08 87 
04 00 00 
    All code 
  
  
  
======== 
  
  
                                                                   0: 
0c 44                   or     $0x44,%al 
  
  
                                                           2:   0f b6 4c 
24 13          movzbl 0x13(%rsp),%ecx 
  
  
                                                  7:   44 8b 44 24 14 
       mov    0x14(%rsp),%r8d 
  
  
                                          c:   48 89 44 24 20 
mov    %rax,0x20(%rsp) 
  
  
                                  11:   49 8b 04 24             mov 
(%r12),%rax 
  
  
                           15:   4c 8b 54 24 18          mov 
0x18(%rsp),%r10 
  
  
                           1a:   48 c1 e8 09             shr 
$0x9,%rax 
  
  
                           1e:   83 e0 01                and 
$0x1,%eax 
  
  
                           21:   88 44 24 11             mov 
%al,0x11(%rsp) 
  
  
                           25:   e9 ce fe ff ff          jmp 
0xfffffffffffffef8 
  
  
                           2a:*  0f 0b                   ud2 
<-- trapping instruction 
  
  
                  2c:   41 f7 46 08 87 04 00    testl  $0x487,0x8(%r14) 
  
  
  
          33:   00 
  
  
  
  34:   75 91                   jne    0xffffffffffffffc7 
  
  
                                                                  36: 
eb 83                   jmp    0xffffffffffffffbb 
  
  
                                                          38:   41 f7 46 
08 87 04 00    testl  $0x487,0x8(%r14) 
  
  
                                                 3f:   00 
  
  
  
  
  
  
  
                               Code starting with the faulting 
instruction 
  
  
  
=========================================== 
  
  
                                                                   0: 
0f 0b                   ud2 
  
  
                                                           2:   41 f7 46 
08 87 04 00    testl  $0x487,0x8(%r14) 
  
  
                                                  9:   00 
  
  
  
                                          a:   75 91 
jne    0xffffffffffffff9d 
  
  
                                   c:   eb 83                   jmp 
0xffffffffffffff91
    e:   41 f7 46 08 87 04 00    testl  $0x487,0x8(%r14) 
  
  
                                                                   15:   00
[   33.636580] RSP: 0018:ffffd3ae43327a10 EFLAGS: 00010246
[   33.636584] RAX: ffff8a6164a50f00 RBX: 000000008020001e RCX: 
0000000000000000
[   33.636585] RDX: ffffd3ae43327a40 RSI: fffff51cc4929400 RDI: 
ffffd3ae43327a80
[   33.636587] RBP: ffffd3ae43327ab0 R08: 0000000000000001 R09: 
ffffffffaa799600
[   33.636588] R10: ffff8a6164a50e00 R11: ffffd3ae43327ab0 R12: 
fffff51cc4929400
[   33.636589] R13: ffff8a6164a50e00 R14: ffff8a6140042a00 R15: 
0000000000000000
[   33.636590] FS:  00007f6c8ee08680(0000) GS:ffff8a68d20c3000(0000) 
knlGS:0000000000000000 
  
                                                                   [ 
33.636591] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033 
  
  
                                                            [ 
33.636592] CR2: 00007f6c8e4578e0 CR3: 000000012fdb0000 CR4: 
0000000000b50ef0 
  
  
[   33.636594] Call Trace: 
  
  
                                                                [ 
33.636596]  <TASK> 
  
  
                                                            [ 
33.636598] ? __call_rcu_common (./arch/x86/include/asm/atomic64_64.h:15 
./include/linux/atomic/atomic-arch-fallback.h:2583 
./include/linux/atomic/atomic-long.h:38 
./include/linux/atomic/atomic-instrumented.h:3189 
kernel/rcu/rcu_segcblist.h:52 kernel/rcu/tree.c:2956 
kernel/rcu/tree.c:2967 kernel/rcu/tree.c:3106) 
  
  
  
  [   33.636605] ? platform_remove (drivers/base/platform.c:1424) 
  
  
                                                                  [ 
33.636610] kfree (mm/slub.c:4599 mm/slub.c:4647 mm/slub.c:4845) 
  
  
                                                            [ 
33.636613] ? mntput_no_expire (fs/namespace.c:259 fs/namespace.c:1492) 
  
  
                                                            [ 
33.636626] platform_remove (drivers/base/platform.c:1424) 
  
  
                                                            [ 
33.636628] device_release_driver_internal (drivers/base/dd.c:1275 
drivers/base/dd.c:1296) 
  
                                                                  [ 
33.636634] driver_detach (drivers/base/dd.c:1360) 
  
  
                                                            [ 
33.636637] bus_remove_driver (drivers/base/bus.c:748) 
  
  
                                                            [ 
33.636640] __do_sys_delete_module (kernel/module/main.c:781) 
  
  
                                                            [ 
33.636646] do_syscall_64 (arch/x86/entry/syscall_64.c:63 (discriminator 
1) arch/x86/entry/syscall_64.c:94 (discriminator 1))
[   33.636654] ? vfs_read (fs/read_write.c:489 fs/read_write.c:570)
[   33.636658] ? ___pte_offset_map (./include/linux/pgtable.h:347 
(discriminator 2) ./include/linux/pgtable.h:624 (discriminator 2) 
mm/pgtable-generic.c:289 (discriminator 2)) 
  
    [   33.636663] ? next_uptodate_folio (./include/linux/xarray.h:1722 
mm/filemap.c:3585) 
  
                                                                    [ 
33.636668] ? __mod_memcg_lruvec_state (mm/memcontrol.c:586 
mm/memcontrol.c:771)
[   33.636673] ? mod_objcg_state (mm/memcontrol.c:2475 mm/memcontrol.c:2837)
[   33.636675] ? xas_load (./include/linux/xarray.h:175 
./include/linux/xarray.h:1264 lib/xarray.c:241)
[   33.636680] ? xa_load (lib/xarray.c:1624)
[   33.636683] ? __memcg_slab_free_hook (mm/memcontrol.c:3093 
(discriminator 1))
[   33.636686] ? __x64_sys_close (fs/open.c:1584 fs/open.c:1566 
fs/open.c:1566)
[   33.636689] ? kmem_cache_free (mm/slub.c:4646 (discriminator 1) 
mm/slub.c:4748 (discriminator 1))
[   33.636692] ? syscall_exit_to_user_mode 
(./arch/x86/include/asm/irqflags.h:37 
./arch/x86/include/asm/irqflags.h:114 ./include/linux/entry-common.h:232 
kernel/entry/common.c:206 kernel/entry/common.c:218)
[   33.636695] ? do_syscall_64 (arch/x86/entry/syscall_64.c:113)
[   33.636698] ? __count_memcg_events (mm/memcontrol.c:586 
mm/memcontrol.c:862)
[   33.636699] ? handle_mm_fault (mm/memory.c:6182 mm/memory.c:6335)
[   33.636704] ? do_user_addr_fault (arch/x86/mm/fault.c:1338)
[   33.636710] ? exc_page_fault (./arch/x86/include/asm/irqflags.h:37 
./arch/x86/include/asm/irqflags.h:114 arch/x86/mm/fault.c:1488 
arch/x86/mm/fault.c:1538)
[   33.636713] entry_SYSCALL_64_after_hwframe 
(arch/x86/entry/entry_64.S:130)
[   33.636716] RIP: 0033:0x7f6c8e53519b
[ 33.636719] Code: 73 01 c3 48 8b 0d 5d bc 0d 00 f7 d8 64 89 01 48 83 c8 
ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa b8 b0 00 00 00 0f 05 
<48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 2d bc 0d 00 f7 d8 64 89 01 48

And this was built and reproduced from platform-x86/review-ilpo-fixes:

0581d384f344e (HEAD, platform-x86/review-ilpo-fixes) 
platform/x86/amd/hsmp: Make amd_hsmp and hsmp_acpi as mutually exclusive 
drivers
8e81b9cd6e951 drivers/platform/x86/amd: pmf: Check for invalid Smart PC 
Policies
690d722e02819 drivers/platform/x86/amd: pmf: Check for invalid 
sideloaded Smart PC Policies
02c6e43397c39 (tag: platform-drivers-x86-v6.15-4, platform-x86/fixes)
